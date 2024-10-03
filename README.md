# ElementaryHTMX: Hypertext web apps with Swift

**Ergonomic [HTMX](https://htmx.org/) extensions for [Elementary](https://github.com/sliemeobn/elementary)**

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fsliemeobn%2Felementary-htmx%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/sliemeobn/elementary-htmx) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fsliemeobn%2Felementary-htmx%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/sliemeobn/elementary-htmx)

```swift
import Elementary
import ElementaryHTMX

form(.hx.post("/items"), .hx.target("#list"), .hx.swap(.outerHTML)) {
    input(.type(.text), .name("item"), .value("New Item"))
    input(.type(.submit), .value("Add Item"))
}

div {
    button(.hx.delete("items/\(item.id)")) { "❌" }
    item.text
}

MyFragment(items: items)
    .attributes(.hx.swapOOB(.outerHTML, "#list"))
```
```swift
import Elementary
import ElementaryHTMXSSE

div(.hx.ext(.sse), .sse.connect("/time"), .sse.swap("message")) {
    Date()
}
```
```swift
import Elementary
import ElementaryHTMXWS

div(.hx.ext(.ws), .ws.connect("/echo"), .hx.target("#echo")) {
    form(.ws.send) {
        input(.type(.text), .name("message"))
        button { "Send" }
    }
    div(.id("echo")) {}
}
// Hint: The server needs to return a HTML element with the id of the .hx.target
```

## Play with it

Check out the [Hummingbird example app](https://github.com/sliemeobn/elementary-htmx/tree/main/Examples/HummingbirdDemo).

Check out the [Vapor example app](https://github.com/sliemeobn/elementary-htmx/tree/main/Examples/VaporDemo).

## Documentation

The package brings the `.hx` syntaxt to all `HTMLElements` - providing a rich API for most [HTMX attributes](https://htmx.org/docs/).

There is also a `ElementaryHTMXSSE` module that adds the `.sse` syntax for the [Server Sent Events extensions.](https://github.com/bigskysoftware/htmx-extensions/blob/main/src/sse/README.md)

## Future directions

- Add module (or separate package?) for HTMX Request and Response headers

PRs welcome.
