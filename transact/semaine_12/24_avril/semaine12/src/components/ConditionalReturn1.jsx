const ConditionalReturn1 = ({condition, text}) => {

    if (condition === null)
        return;

return (
        <>
            <h1>{text} will show here</h1>
        </>
    )
}
export default ConditionalReturn1;