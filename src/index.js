module.exports ={
  get:(event, context, callback)=>{

    const response = `Hello ${event.name}!, Lambda function created.`;

    callback(null, response);
  }
};
