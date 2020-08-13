let innerWidthDesc = Object.getOwnPropertyDescriptor(window, 'innerWidth');
let getOriginalInnerWidth = innerWidthDesc.get.bind(window);
let setOriginalInnerWidth = innerWidthDesc.set.bind(window);

let VERTICAL_TABS_ENABLED = false;

Object.defineProperty(window, 'innerWidth', {
  get() {
    if (VERTICAL_TABS_ENABLED) {
      return getOriginalInnerWidth() - 200;
    }

    return getOriginalInnerWidth();
  },

  set(value) {
    setOriginalInnerWidth(value + 200);
  }
});

document.body.addEventListener('keydown', (e) => {
  if (e.code === 'Minus' && e.metaKey && !e.shiftKey && !e.ctrlKey && !e.altKey) {
    e.preventDefault();
    e.stopPropagation();

    VERTICAL_TABS_ENABLED = !VERTICAL_TABS_ENABLED;

    document.body.classList.toggle('vertical-tab-bar-enabled');

    let firstTabs = document.querySelector('.title.tabs')
    firstTabs.classList.toggle('vertical-tab-bar');

    document.querySelector('.monaco-workbench').style.backgroundColor = firstTabs.style.backgroundColor;

    window.dispatchEvent(new Event('resize'));
  }
}, { capture: true })

window.addEventListener('resize', () => {
  let sidebar = document.querySelector('.sidebar');
  let activityBar = document.querySelector('.activitybar');

  if (VERTICAL_TABS_ENABLED && sidebar.className.includes('right')) {
    sidebar.parentElement.style.transform = 'translateX(200px)';
    activityBar.parentElement.style.transform = 'translateX(200px)';

    sidebar.parentElement.parentElement.previousElementSibling.querySelectorAll('.monaco-sash').forEach((el) => {
      el.style.transform = 'translateX(200px)';
    });
  } else {
    sidebar.parentElement.style.transform = '';
    activityBar.parentElement.style.transform = '';

    sidebar.parentElement.parentElement.previousElementSibling.querySelectorAll('.monaco-sash').forEach((el) => {
      el.style.transform = '';
    });
  }
});
