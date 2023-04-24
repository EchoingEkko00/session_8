import { useRef, useEffect } from 'react';

export const InputFocus2 = () => {
    const inputRef = useRef();

    useEffect(() => {
        // Logs `HTMLInputElement`
        console.log(inputRef.current);

        inputRef.current.focus();
    }, []);

    // Logs `undefined` during initial rendering
    console.log(inputRef.current);

    return <input ref={inputRef} type="text" />;
}