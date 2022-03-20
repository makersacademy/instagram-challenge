import React, { useState } from "react";
import { useNavigate } from "react-router";
 
export default function Create() {

 const [form, setForm] = useState({
   email: "",
   password: ""
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
   const newUser = { ...form };

   await fetch("http://localhost:4000/users/", {
     method: "POST",
     headers: {
       "Content-Type": "application/json",
     },
     body: JSON.stringify(newUser),
   })
   .catch(error => {
     window.alert(error);
     return;
   });
 
   setForm({ name: "", password: "" });
   navigate("/");
 }
 
 // This following section will display the form that takes the input from the user.
 return (
   <div>
     <h1>Inside Create New User</h1>
     <h3>Sign Up (React)</h3>
     <form onSubmit={onSubmit}>
      <div className="form-group">
         <label htmlFor="username">User Name</label>
         <input
           type="input"
           className="form-control"
           id="username"
           value={form.username}
           onChange={(e) => updateForm({ username: e.target.value })}
         />
       </div>
       <div className="form-group">
         <label htmlFor="email">Email</label>
         <input
           type="email"
           className="form-control"
           id="email"
           value={form.email}
           onChange={(e) => updateForm({ email: e.target.value })}
         />
       </div>
       <div className="form-group">
         <label htmlFor="password">Password</label>
         <input
           type="password"
           className="form-control"
           id="password"
           value={form.password}
           onChange={(e) => updateForm({ password: e.target.value })}
         />
       </div>
       <div className="form-group">
         <input
           type="submit"
           value="Sign Up"
           className="btn btn-primary"
         />
       </div>
     </form>
   </div>
 );
}



// curl "http://localhost:4000/users/" \
//   -X POST \
//   -H "Content-Type: application/json" \
//   -d '{"email":"test@test.com","password":"test"}'

//   {"email":"test@test.com","password":"test"}

//   {"user": {"email":"test@test.com","password":"test"}}