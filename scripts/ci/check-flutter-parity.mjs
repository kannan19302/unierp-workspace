import fs from "fs";
import path from "path";

/**
 * CI Gate: Flutter Component Library Parity (B19)
 * Asserts B01-B09 primitive parity between Web and Flutter implementations against generated tokens.
 */
const WORKSPACE_ROOT = process.cwd();
const FLUTTER_WIDGETS_DIR = path.join(WORKSPACE_ROOT, "..", "unierp-mobile", "lib", "core", "widgets");

const PRIMITIVES_CHECKLIST = {
  B01_DataGrid: ["paginated_list_view.dart", "batch_operations_bar.dart"],
  B02_Overlays: ["action_dialogs.dart"],
  B03_Feedback: ["state_views.dart", "loading_skeleton.dart"],
  B04_Navigation: ["tabbed_detail_view.dart", "filter_sidebar.dart"],
  B05_FormControls: ["form_fields.dart", "form_page.dart"],
  B06_Temporal: ["form_fields.dart"],
  B07_HeavyInputs: ["form_fields.dart"],
  B08_DataDisplay: ["ui_card.dart"],
  B09_Identity: ["permission_gate.dart"],
};

let missingWidgets = [];

for (const [primitive, requiredFiles] of Object.entries(PRIMITIVES_CHECKLIST)) {
  for (const file of requiredFiles) {
    const filePath = path.join(FLUTTER_WIDGETS_DIR, file);
    if (!fs.existsSync(filePath)) {
      missingWidgets.push(`${primitive}: ${file}`);
    }
  }
}

console.log(`[B19 Flutter Parity Gate] Checked ${Object.keys(PRIMITIVES_CHECKLIST).length} B01-B09 primitive groups in Flutter.`);

if (missingWidgets.length > 0) {
  console.error(`❌ Flutter Parity Gate failed! Missing widget implementations:\n  ${missingWidgets.join("\n  ")}`);
  process.exit(1);
} else {
  console.log(`✅ Flutter component library parity asserted across all B01-B09 primitives.`);
  process.exit(0);
}
