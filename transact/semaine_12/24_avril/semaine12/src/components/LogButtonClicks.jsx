import { useRef } from 'react';
export const LogButtonClicks = () => {
    const countRef = useRef(0);

    const handle = () => {
        countRef.current++;
        console.log(`Clicked ${countRef.current} times`);
    };

    console.log('I rendered!');

    return <button onClick={handle}>Click me (ref) {countRef.current}</button>;
}