import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-cleanup"
export default class extends Controller {
  static targets = ["form"];

  resetForm() {
    this.formTarget.reset();
  }
}
