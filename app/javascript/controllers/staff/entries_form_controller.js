import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

// Connects to data-controller="staff--entries-form"
export default class extends Controller {
  connect() {
    $("div.button-wrapper").on("click", "button#update-entries-button", () => {
      const approved = [];
      const not_approved = [];
      const canceled = [];
      const not_canceled = [];

      $("table.entries input.approved").each((index, elem) => {
        if ($(elem).prop("checked")) {
          approved.push($(elem).data("entry-id"));
        } else {
          not_approved.push($(elem).data("entry-id"));
        }
      });

      $("#form_approved").val(approved.join(":"));
      $("#form_not_approved").val(not_approved.join(":"));

      $("table.entries input.canceled").each((index, elem) => {
        if ($(elem).prop("checked")) {
          canceled.push($(elem).data("entry-id"));
        } else {
          not_canceled.push($(elem).data("entry-id"));
        }
      });

      $("#form_canceled").val(canceled.join(":"));
      $("#form_not_canceled").val(not_canceled.join(":"));

      $("div.button-wrapper form").submit();
    });
  }
}
