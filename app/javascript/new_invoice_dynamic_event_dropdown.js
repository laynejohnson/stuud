export const initNewInvoiceDynamicEventDropdown =  () => {
  const clientDropdown = document.querySelector("#invoice_client_id");
  const eventDropdowns = document.querySelectorAll(".invoice_event_id");
  const form = document.querySelector("#new_invoice");
  if (!form) {return}
  clientDropdown.addEventListener("change", () => {
    const selectedClientId = clientDropdown.value
    eventDropdowns.forEach((dropdown) => {
      dropdown.hidden = true;
    });
    const eventDropdown = document.querySelector(`.form-group[data-client-id='${selectedClientId}']`);
    if (eventDropdown) {
      eventDropdown.hidden = false
    };
  })
  form.addEventListener('submit', () => {
    const eventDropdowns = document.querySelectorAll(".invoice_event_id[hidden]");
    eventDropdowns.forEach((dropdown) => {
      dropdown.remove();
    });
  });
}
