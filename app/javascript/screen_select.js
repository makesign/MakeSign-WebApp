//Deactivate the current checkbox, if another checkbox is activated

document.addEventListener('DOMContentLoaded', () => {
    const checkboxes = document.querySelectorAll('.single-select-checkbox');
    
    checkboxes.forEach(checkbox => {
      checkbox.addEventListener('change', () => {
        if (checkbox.checked) {
          checkboxes.forEach(otherCheckbox => {
            if (otherCheckbox !== checkbox) {
              otherCheckbox.checked = false;
            }
          });
        }
      });
    });
  });
  