// To see this message, follow the instructions for your Ruby framework.
//
// When using a plain API, perhaps it's better to generate an HTML entrypoint
// and link to the scripts and stylesheets, and let Vite transform it.
console.log('Vite ⚡️ Ruby')

// Example: Import a stylesheet in <sourceCodeDir>/index.css
// import '~/index.css'
import '~/stylesheets/application.css'
import "~/stylesheets/syntax.css"
import "@fontsource-variable/inter"
import "protos-stimulus"

import { Application } from "@hotwired/stimulus"
import FeatureController from "~/controllers/feature"

window.Stimulus = Application.start()
Stimulus.register("feature", FeatureController)
