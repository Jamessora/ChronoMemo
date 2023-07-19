// app/javascript/controllers/confirm_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  confirm(event) {
    if (!window.confirm("Are you sure?")) {
      event.preventDefault();
    }
  }
}
