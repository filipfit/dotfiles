export function PopupRevealer(
    name,
    child,
    transition = "slide_down"
) {
        return Widget.Box(
            {class_name: "popup-revealer"},
            Widget.Revealer({
                child: Widget.Box({
                    class_name: "popup-revealer-content",
                    child
                }),
                transition,
                transitionDuration: 500,
                setup: self => self.hook(App, (_, wname, visible) => {
                    if (wname === name)
                        self.reveal_child.visible
                })
            })

        )
    }