
import 'select2';

const initSelect2 = () => {

  setTimeout(() => {
    $('#equipment_category').select2(); // (~ document.querySelectorAll)
  }, 500)
};

export { initSelect2 };


