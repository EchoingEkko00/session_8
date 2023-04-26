import {useState} from "react";

const Form1 = () => {
    const [firstName, setFirstName] = useState("Alice");
    const submit = (e) => {
        e.preventDefault()
        console.log(firstName);
    }
return (
        <>
            <form onSubmit={submit}>
                <input type="text" value={firstName}
                       onChange={(e) =>setFirstName(e.target.value)}/>
            </form>
        </>
    )
}
export default Form1