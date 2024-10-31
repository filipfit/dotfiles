const hyprland = await Service.import("hyprland")

export function ClientTitle() {
    return Widget.Label({
        class_name: "client-title",
        label: hyprland.active.client
            .bind("title")
            .as(title => { // Get the last part of the title delimited by ' - '
                const s = title.split(" - ")
                return s[s.length - 1]
            })
    })
}