const ConditionalReturn3 = ({condition, text1, text2}) => {

    return (
        <>
            {condition  ? <h1>{text1}</h1> : <h2>{text2}</h2>}
        </>
    )
}
export default ConditionalReturn3;