document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items

  const addLi = (e) => {
    e.preventDefault();
    const favInput = document.querySelector('input.favorite-input');
    const inputValue = favInput.value;
    favInput.value = "";

    const li = document.createElement("li");
    li.textContent = inputValue;

    const list = document.getElementById("sf-places");
    list.appendChild(li);

  };

  document.querySelector("input.favorite-submit").addEventListener("click", (e) => {addLi(e);});
});



  // adding new photos

  // --- your code here!
