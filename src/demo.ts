import todo from ".";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("demo");
  root.style.position = "relative";

  const container = document.createElement("div");
  container.innerHTML = `${todo()}`;
  container.style.position = "absolute";
  container.style.left = "0px";
  container.style.top = "0px";
  root.appendChild(container);
  container.style.fontSize = "18px";
  container.style.fontFamily = "sans";
  container.style.transition = "left 1s, top 1s";
  document.body.style.transition = "background-color 1s";
  setInterval(() => {
    const rand = () => Math.floor(Math.random() * 255);
    document.body.style.backgroundColor = `rgb(${rand()}, ${rand()}, ${rand()})`;
    container.style.left = `${Math.random() * container.clientWidth}px`;
    container.style.top = `${Math.random() * container.clientHeight}px`;
  }, 2000);
});
