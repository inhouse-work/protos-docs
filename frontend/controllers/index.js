import { Application } from "@hotwired/stimulus"
import FeatureController from "~/controllers/feature"

window.Stimulus = Application.start()
Stimulus.register("feature", FeatureController)
