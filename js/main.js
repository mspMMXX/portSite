const button = document.getElementById("myButton");
const lable = document.getElementById("inputLabel");
let myText = "";

button.addEventListener("click", () => {
  myText = document.getElementById("input-one").ariaValueMax;
  lable.value = myText;
});
