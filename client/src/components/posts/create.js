import React, { useState } from "react";
import { useNavigate } from "react-router";
 
export default function Create() {

 const [form, setForm] = useState({
   message: ""
 });

 const navigate = useNavigate();
 
 // This method will update the state properties.
 function updateForm(value) {
   return setForm((prev) => {
     return { ...prev, ...value };
   });
 }
 
 // This function will handle the submission.
 async function onSubmit(e) {
   e.preventDefault();
 
   // When a post request is sent to the create url, add a new record to the database.
   const newPost = { ...form };

   await fetch("http://localhost:4000/posts/", {
     method: "POST",
     headers: {
       "Content-Type": "application/json",
     },
     body: JSON.stringify(newPost),
   })
   .catch(error => {
     window.alert(error);
     return;
   });
 
   setForm({ message: ""});
   navigate("/");
 }
 
 // This following section will display the form that takes the input from the user.
 return (
   <div>
     <h3>Post Messge (React)</h3>
     <form onSubmit={onSubmit}>
      <div className="form-group">
         <label htmlFor="message">Message</label>
         <input
           type="input"
           className="form-control"
           id="message"
           value={form.message}
           onChange={(e) => updateForm({ message: e.target.value })}
         />
       </div>
      
       <div className="form-group">
         <input
           type="submit"
           id="post-message"
           value="Post"
           className="btn btn-primary"
         />
       </div>
     </form>
   </div>
 );
}


// curl "http://localhost:4000/posts/" \
//   -X POST \
//   -H "Content-Type: application/json" \
//   -d '{"message":"test@test.com"}'

//curl "http://localhost:4000/posts"
