// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application";
import Chartjs from "@stimulus-components/chartjs";

import ProponentsController from "./proponents_controller";
application.register("proponents", ProponentsController);
application.register("chartjs", Chartjs);
