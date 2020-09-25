import React from 'react';

const renderMessageClassName = (props)=>{
    let className = "alert ";
    if(props.message.msgError)
        className = className + "alert-danger";
    else
        className = className + "alert-success";
    className = className + " text-center";
    return className;
}

const Message = (props)=>{
    return(
        <div className={renderMessageClassName(props)} role="alert">
            {props.message.msgBody}
        </div>
    )
}

export default Message;