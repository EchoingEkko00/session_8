const ConditionalReturn2 = ({condition, text}) => {

    return (
        <>
            {condition && <h1>{text} will show here</h1>}
        </>
    )
}
export default ConditionalReturn2;