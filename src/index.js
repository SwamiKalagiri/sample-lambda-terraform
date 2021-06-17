module.exports ={
  get:(event, context, callback)=>{

    const response = `Hello ${event.name}!, Welcome lambda world.`;

    callback(null, response);
  }
};
