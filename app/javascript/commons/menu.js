const CLASSES = {
    menuOpened: 'is-opened',
    hasMenuOpened: 'has-menu-opened'
};
class MenuBurger {
    constructor (selector) {
        this.element = selector;
        this.openButton = this.element.querySelector('button.btn__open');
        this.closeButton = this.element.querySelector('button.btn__close');
        this.menu = this.element.querySelector('.menu');
        this.links = this.menu.querySelectorAll('a');
        this.logo = this.element.querySelector('.navbar-brand');

        this.state = {
            isOpened: false
        };

        this.listen();
    }

    listen () {
        this.openButton.addEventListener('click', () => {
            this.toggleMenuBurger();
        });
        this.closeButton.addEventListener('click', () => {
            this.toggleMenuBurger(false);
        });
        if (this.state.isOpened) {
            window.addEventListener('keydown', (event) => {
                if (event.keyCode === 27 || event.key === 'Escape') {
                    this.closeEverything();
                }
            });
        }
    }

    toggleMenuBurger (open = !this.state.isOpened) {
        let classAction;
        this.state.isOpened = open;
        classAction = this.state.isOpened ? 'add' : 'remove';
        this.openButton.setAttribute('aria-expanded', this.state.isOpened);
        this.menu.classList[classAction](CLASSES.menuOpened);
        document.body.classList[classAction](CLASSES.hasMenuOpened);
    }

    closeEverything () {
        this.state.isOpened = false;
        this.toggleMainMenu(false);
    }
}
document.addEventListener("turbo:load", function(event) {
  const navMenu = document.querySelector('nav#header-navigation');
  new MenuBurger(navMenu);
})
