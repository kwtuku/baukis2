import { Controller } from "@hotwired/stimulus";
import jquery from "jquery";
window.$ = jquery;

function toggle_home_address_fields() {
  const checked = $("input#form_inputs_home_address").prop("checked");
  $("fieldset#home-address-fields input").prop("disabled", !checked);
  $("fieldset#home-address-fields select").prop("disabled", !checked);
}

function toggle_work_address_fields() {
  const checked = $("input#form_inputs_work_address").prop("checked");
  $("fieldset#work-address-fields input").prop("disabled", !checked);
  $("fieldset#work-address-fields select").prop("disabled", !checked);
}

// Connects to data-controller="staff--customer-form"
export default class extends Controller {
  connect() {
    console.log("aaa");
    toggle_home_address_fields();
    toggle_work_address_fields();
    $("input#form_inputs_home_address").on("click", () => {
      toggle_home_address_fields();
    });
    $("input#form_inputs_work_address").on("click", () => {
      toggle_work_address_fields();
    });
  }
}
