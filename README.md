
# open-with-zotero

This tool opens PDF files located within Zotero’s local `storage` directory by extracting the 8-character subfolder name (e.g., `N7SMB24A`) that Zotero assigns to each library item. It uses this ID to generate and launch a `zotero://open-pdf/library/items/` URI for direct access in the Zotero desktop app.

## 🛠️ What It Does

- Adds an **"Open with Zotero"** option to the Windows right-click menu for PDF files stored in Zotero’s `storage` folder. This lets you jump directly to the file' corresponding item in the Zotero desktop app.
- Works with tools like **AnyText Searcher**: after finding a file via text search, you can quickly open it in Zotero.

## 🧩 Files Included

| File                  | Purpose                                      |
|-----------------------|----------------------------------------------|
| `open_with_zotero.bat`| The main source code                         |
| `open_with_zotero.exe`| Compiled executable (Windows only)           |
| `register_to_right-click_menu.bat`    | A .bat file used to add `open with zotero` button on the righ-click menu (require `Run as Administrator` )        |

## 🔧 How to Use

1. Download the repository and ensure `open_with_zotero.exe` and `register_to_right-click_menu.bat` are in the same folder.
2. Run `register_to_right-click_menu.bat` **as Administrator** to add the option to the right-click menu.
3. Navigate to a Zotero `storage` folder (e.g., `Zotero/storage/N7SMB24A`).
4. Right-click a PDF file → choose **"Show more options"** → click **Open with Zotero**.

## 📝 Notes

- The tool assumes the PDF file is stored in a standard Zotero `storage` subfolder.
- `open_with_zotero.bat` and `open_with_zotero.exe` offer the same functionality; however, the `.bat` version will briefly display a terminal window when executed, while the `.exe` version runs silently in the background.
- If you prefer to use the `.bat` version, update the `register_to_right-click_menu.bat` file by changing: `set WHICH_TO_REGISTER=open_with_zotero.exe` to `set WHICH_TO_REGISTER=open_with_zotero.bat`
- If you move the repository folder to a different location, you must re-run `register_to_right-click_menu.bat` to update the right-click menu registration with the new path.

