document.addEventListener("turbolinks:load", function () {
  const addProfilePictureButton = document.getElementById(
    "add_profile_image_button"
  );
  const userProfilePicture = document.getElementById("user_profile_image");
  const profilePicturePreview = document.getElementById(
    "profile_image_preview"
  );

  if (!addProfilePictureButton) return;

  addProfilePictureButton.onclick = () => {
    userProfilePicture.click();
  };

  userProfilePicture.onchange = (e) => {
    let reader = new FileReader();
    reader.onload = (e) => {
      profilePicturePreview.setAttribute("src", e.target.result);
    };

    try {
      reader.readAsDataURL(e.target.files[0]);
    } catch (e) {
      console.log(e);
    }

    profilePicturePreview.classList.add("active");
  };
});
