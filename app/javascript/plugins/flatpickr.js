import flatpickr from 'flatpickr';
// // import "flatpickr/dist/themes/airbnb.css";

// // flatpickr(".datepicker", {});
// //   // altInput: true,
// //   // allowInput: true


const startDateSelector = document.getElementById("booking_start_date");
const endDateSelector = document.getElementById("booking_end_date");

const initFlatPickr = () => {
    const startPicker = flatpickr(startDateSelector, {
        minDate: 'today',
        dateFormat: 'd-m-Y',
        disableMobile: 'true',
        onChange: function(selectedDates, selectedDate) {
          // DO SOMETHING
          console.log(selectedDate)
          if (selectedDate !== '"') {
            endDateSelector.classList.remove("disabled");
            endDateSelector.disabled = false;
            endPicker.set("minDate", selectedDate);
          }
        }
      })
      const endPicker = flatpickr(endDateSelector, {
        minDate: 'today',
        dateFormat: 'd-m-Y',
        disableMobile: 'true',
        onChange: function(selectedDates, selectedDate) {
          // DO SOMETHING

        }
      })
}
export { initFlatPickr };
