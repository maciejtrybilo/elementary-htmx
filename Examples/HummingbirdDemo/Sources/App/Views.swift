import Elementary
import ElementaryHTMX

struct MainPage: HTMLDocument {
    var title: String { "Hummingbird + Elementary + HTMX" }

    var model: Model

    var head: some HTML {
        meta(.charset(.utf8))
        script(.src("/htmx.min.js")) {}
        link(.href("/pico.min.css"), .rel(.stylesheet))
    }

    var body: some HTML {
        header(.class("container")) {
            h2 { "Hummingbird + Elementary + HTMX Demo" }
        }
        main(.class("container")) {
            div {
                // example of using hx-target and hx-swap
                form(.hx.post("/items"), .hx.target("#list"), .hx.swap(.outerHTML)) {
                    div(.class("grid")) {
                        input(.type(.text), .name("item"), .value("New Item"), .required)
                        input(.type(.submit), .value("Add Item"))
                    }
                }
            }
            ItemList(items: model.items)
        }
    }
}

struct ItemList: HTML {
    var items: [String]

    var content: some HTML<HTMLTag.div> {
        div(.id("list")) {
            h4 { "Items" }
            p { "Count: \(items.count)" }

            for (index, item) in items.enumerated() {
                div {
                    // this hx-delete will use OOB swap
                    button(.hx.delete("items/\(index)")) { "X" }
                    " "
                    item
                }
            }
        }
    }
}
