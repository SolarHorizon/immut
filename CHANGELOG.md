## 0.4.4

- Fixed `finishDraft` mutating non-draft tables

## 0.4.3

- Added `makeDraftSafeReadOnly`
- Added `table.find`
- Added `table.concat`

## 0.4.2

- `produce` now allows all values except tables with metatables as a base

## 0.4.1

- Added `nothing` as an alias for `None`

## 0.4.0

- All table library replacement functions can now use non-draft tables
- Table library is now found under `Immut.table`
- Added `table.sort`
- Added `table.clear`
- Added `makeDraftSafe`
- Fixed Draft iterator not returning drafted versions of nested tables
- `produce` will now finalize any drafts found in non-draft table return values
- Added `None`

## 0.3.2

- `insert` will no longer error when not providing a position

## 0.3.1

- Fixed `remove` causing an error when required

## 0.3.0

- Added documentation
- Added `remove` and `insert` for use with drafts that are lists.
- The `#` operator will now work on drafts that are lists.

## 0.2.1

- Added `isDraftable`

## 0.2.0

- Added `original` and `current`
- Exposed some of the internals of Immut for advanced users.
  - `createDraft`
  - `finishDraft`
  - `isDraft`

## 0.1.0

- Initial release
