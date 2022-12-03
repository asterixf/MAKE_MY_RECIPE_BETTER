import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static target = ["bookmark-checker"]
  connect() {
    console.log("Hello, pana.");
  }

  addToFavourites() {
    console.log("Working!")
    // submit button or action
  } 
}
