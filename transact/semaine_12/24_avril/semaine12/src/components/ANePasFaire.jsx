import {useRef, useEffect} from 'react';
// The function scope of the functional component should either calculate the output or invoke hooks.
export const ANePasFaire = ({prop}) => {
    const myRef = useRef(0);

    useEffect(() => {
        myRef.current++; // Good!

        setTimeout(() => {
            myRef.current++; // Good!
        }, 1000);
    }, []);

    const handler = () => {
        myRef.current++; // Good!
    };

    myRef.current++; // Bad!

    if (prop) {
        myRef.current++; // Bad!
    }

    return (
        <>
            <button onClick={handler}>My button</button>
            <p>{myRef.current}</p>
        </>
    )
}