hook global BufCreate .*\.(swift2) %{
    set-option buffer filetype swift2
}

hook global WinSetOption filetype=swift2 %{
    require-module swift2
}

hook -group swift-highlight global WinSetOption filetype=swift2 %{
    add-highlighter window/swift ref swift2
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/swift2 }
}


provide-module swift2 %{

add-highlighter shared/swift2 regions
add-highlighter shared/swift2/code default-region group
add-highlighter shared/swift2/string_block region %{(?<!')"""} %{(?<!\\)(\\\\)*"""} ref swift2/string
add-highlighter shared/swift2/string region %{(?<!')"} %{(?<!\\)(\\\\)*"} fill string
add-highlighter shared/swift2/comment region /\* \*/ group
add-highlighter shared/swift2/line_comment region // $ ref swift/comment

add-highlighter shared/swift2/comment/ fill comment

add-highlighter shared/swift2/code/ regex %{\b(true|false|nil)\b|\b-?(?!\$)\d+[fdiu]?|'((\\.)?|[^'\\])'} 0:value
add-highlighter shared/swift2/code/ regex "\b(let|var|while|in|for|if|guard|else|do|switch|case|default|break|continue|return|try|catch|throw|new|delete|and|or|not|operator|explicit|func|import|return|init|deinit|get|set)\b" 0:keyword
add-highlighter shared/swift2/code/ regex "\bas\b[!?]?" 0:keyword
add-highlighter shared/swift2/code/ regex "(\$[0-9])\b" 0:keyword
add-highlighter shared/swift2/code/ regex "\b(const|mutable|auto|namespace|inline|static|volatile|class|struct|enum|union|public|protected|private|typedef|virtual|friend|extern|typename|override|final|required|convenience|dynamic)\b" 0:attribute

add-highlighter shared/swift2/code/ regex "\b(self|nil|id|super)\b" 0:value
add-highlighter shared/swift2/code/ regex "\b(Bool|String|UInt|UInt16|UInt32|UInt64|UInt8)\b" 0:type
add-highlighter shared/swift2/code/ regex "\b(IBAction|IBOutlet)\b" 0:attribute
add-highlighter shared/swift2/code/ regex "@\w+\b" 0:attribute

}
