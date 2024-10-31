const date_time = Variable("", {
    poll: [1000, 'date "+%H:%M | %e %b " ', out => {
        return {
            time: out.split(' | ')[0],
            date: out.split(' | ')[1]
        }
    }],
})

export function Clock() {
    const time_label = Widget.Label({
        class_name: "clock_label",
        label: date_time.bind().as(out => out.time)
    })

    const date_label = Widget.Label({
        class_name: "clock_label",
        label: date_time.bind().as(out => out.date)
    })

    // const seperator = Widget.Separator({
    //     class_name: "clock_seperator",
    //     vertical: false,
    // })

    const date_time_box = Widget.Box({
        class_name: "date-time",
        spacing: 8,
        children: [
            time_label,
            // seperator,
            date_label
        ]
    })

    // const revealer = Widget.Revealer({
    //     reveal_child: false,
    //     transition_duration: 0,
    //     child: myLabel("TEST1")
    // })

    // return Widget.Button({
    //     class_name: "clock",
    //     on_clicked: () => revealer.reveal_child = !revealer.reveal_child,
    //     child: Widget.Box({
    //         children: [time_label, revealer]
    //     })
    // })

    return date_time_box

}