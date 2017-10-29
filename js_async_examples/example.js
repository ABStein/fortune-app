
setTimeout(function() {
  console.log("First Task Complete!");
  setTimeout(function secondTask() {
    console.log("Second Task Complete!");    
    setTimeout(function thirdTask() {
      console.log("Third Task Complete!");
    }, 2000);
  }, 2000);
}, 4000);


