// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"


document.addEventListener("turbo:load", () => {
  document.querySelectorAll("[data-carousel]").forEach((carousel) => {
    const track = carousel.querySelector("[data-track]");
    const card = track.querySelector(".mood-card");
    const step = card ? card.getBoundingClientRect().width + 24 : 320; // 22 = gap

    carousel.querySelectorAll(".mood-nav").forEach((btn) => {
      btn.addEventListener("click", () => {
        const dir = parseInt(btn.dataset.dir || "1", 10);
        track.scrollBy({ left: dir * step * 2, behavior: "smooth" }); // scroll de ~2 cartes
      });
    });

    // molette verticale => scroll horizontal (confort desktop)
    track.addEventListener("wheel", (e) => {
      if (Math.abs(e.deltaY) > Math.abs(e.deltaX)) {
        e.preventDefault();
        track.scrollBy({ left: e.deltaY, behavior: "smooth" });
      }
    }, { passive: false });
  });
});
