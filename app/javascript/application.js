// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require toastr
//= require chartkick
//= require Chart.bundle
//= require sb-admin-2.min
import { Application } from "stimulus";
import FormCleanupController from "./controllers/form_cleanup_controller";

const application = Application.start();
application.register("form-cleanup", FormCleanupController);


document.addEventListener("turbo:before-fetch-response", (event) => {
    

});

