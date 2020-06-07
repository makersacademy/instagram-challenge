export default {
  getEmployees: () => {
    return fetch('/employee')
      .then(res => res.json())
      .then(data => data);
  },
  deleteEmployee : (_id) => {
    return fetch(`/employee/${_id}`,
                {method : "delete"})
                .then(res => res.json())
                .then(data => data);
  },
  updateEmployee : (employee) => {
    return fetch(`/employee/${employee_id}`,
                {method : "put",
                body: JSON.stringify(employee),
                headers : {
                "Content-type" : "application/json"
              }}).then(res => res.json())
                .then(data => data);
  },
  createEmployee : (employee) => {
    return fetch(`/employee`,
                {method : "post",
                body: JSON.stringify(employee),
                headers : {
                "Content-type" : "application/json"
              }}).then(res => res.json())
                .then(data => data);
  },
}