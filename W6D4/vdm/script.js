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

  const addToList = (element) => {
     element.preventDefault();
     const input = document.querySelector(".favorite-input");
     const favorite = input.value;
     input.value = "";
     const newItem = document.createElement("li");
     newItem.textContent = favorite;
     const places = document.getElementById("sf-places");
     places.appendChild(newItem);
   };

   const favoriteButton = document.querySelector(".favorite-submit");
   favoriteButton.addEventListener("click", addToList);


  // adding new photos

const newPhoto = (photo) => {
  const photoInfo = document.querySelector(".photo-url-input");
  const newPic = photoInfo.value;
  photoInfo.value = "";
  const newItem = document.createElement("li img");
  const photos = document.getElementById("photos")
  newItem.image = newPic;
  photos.appendChild(newItem);
};

const photoButton = document.querySelector(".photo-url-submit")
photoButton.addEventListener("click", newPhoto);
