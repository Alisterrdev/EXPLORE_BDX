document.addEventListener("turbo:load", () => {
  document.querySelectorAll(".favorite-link").forEach(link => {
    link.addEventListener("click", e => {
      e.preventDefault(); // empêche la navigation

      const heart = link.querySelector(".heart-icon");

      if (heart) {
        heart.classList.toggle("filled");     // toggle couleur et animation
        heart.classList.toggle("fa-regular"); // vide
        heart.classList.toggle("fa-solid");   // plein
      }

      // Envoi POST au back en arrière-plan sans changer de page
      fetch(link.href, {
        method: "POST",
        headers: {
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
          "Accept": "text/vnd.turbo-stream.html"
        },
        credentials: "same-origin"
      });
    });
  });
});
