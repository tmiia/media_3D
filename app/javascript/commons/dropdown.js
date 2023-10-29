

class Dropdown {
    constructor (selector) {
        this.dom = selector;
        this.dropdownButton = this.dom.querySelector('button');

        this.state = {
            isOpened: false
        };
        this.listen();
    }
    listen () {
        this.dropdownButton.addEventListener('click', () => {
            this.toggleDropdown();
        });

        window.addEventListener('keydown', (event) => {
            if (event.keyCode === 27 || event.key === 'Escape') {
                this.toggleDropdown(false);
            }
        });
    }
    toggleDropdown (open = !this.state.isOpened) {
        this.state.isOpened = open;
        console.log(this.state);
        this.dropdownButton.setAttribute('aria-expanded', this.state.isOpened);
    }
}
document.addEventListener("turbo:load", function(event) {
  const shareDropdown = document.querySelector('.dropdown-share');
  if (shareDropdown) {
    new Dropdown(shareDropdown);
  }
  else {
    return;
  }
})
