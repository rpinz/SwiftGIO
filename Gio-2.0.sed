s/GLib.Type/GType/g
s/GLib.CompareFunc/GCompareFunc/g
s/GLib.CompareDataFunc/GCompareDataFunc/g
s/public func (parseName parse_name:/public func parse(name parse_name:/
s/.*no reference counting for GFile, cannot ref.*/	g_object_ref(cast(ptr))/
s/.*no reference counting for GFile, cannot unref.*/	g_object_unref(cast(ptr))/
s/.*no reference counting for GAppInfo, cannot ref.*/	g_object_ref(cast(ptr))/
s/.*no reference counting for GAppInfo, cannot unref.*/	g_object_unref(cast(ptr))/
s/Pem(pem/(PEM/
s/Ssl/SSL/g
s/Tls/TLS/g
s/GTLS/GTls/g
s/Ucs/UCS/g
s/Uri/URI/g
s/Utc/UTC/g
s/Utf/UTF/g
s/Id/ID/g
s/IDle/Idle/g
s/IDent/Ident/g
s/g_io_module_load/_g_io_module_load/g
s/g_io_module_unload/_g_io_module_unload/g
s/: \([A-Za-z.]*Notify[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Func[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Marshal[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Marshaller[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Callback[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Accumulator[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*SignalHandler[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Transformer[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Transform[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Transformer =\)/: @escaping \1/g
s/: \([A-Za-z.]*Hook[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Function[,)]\)/: @escaping \1/g
s/: \([A-Za-z.]*Mapping[,)]\)/: @escaping \1/g
s/path: UnsafeMutablePointer<CChar>/path: UnsafePointer<CChar>/g
s/GObject.Callback/GLibObject.Callback/g
s/let rv = g_dbus_connection_call_with_unix_fd_list_sync(cast.*error)$/let ptrPtr: UnsafeMutablePointer<GDBusConnection> = cast(ptr)\n        let parametersPtr: UnsafeMutablePointer<GVariant> = cast(parameters.ptr)\n        let replyTypePtr: UnsafePointer<GVariantType> = cast(reply_type.ptr)\n        let timeout: gint = gint(timeout_msec)\n        let fdListPtr: UnsafeMutablePointer<GUnixFDList> = cast(fd_list.ptr)\n        let outFdListPtr: UnsafeMutablePointer<UnsafeMutablePointer<GUnixFDList>?> = cast(out_fd_list.ptr)\n        let cancellablePtr: UnsafeMutablePointer<GCancellable> = cast(cancellable.ptr)\n        let rv = g_dbus_connection_call_with_unix_fd_list_sync(ptrPtr, bus_name, object_path, interface_name, method_name, parametersPtr, replyTypePtr, flags, timeout, fdListPtr, outFdListPtr, cancellablePtr, \&error)/
s/let rv = g_dbus_proxy_call_with_unix_fd_list_sync(cast.*error)$/let ptrPtr: UnsafeMutablePointer<GDBusProxy> = cast(ptr)\n        let parametersPtr: UnsafeMutablePointer<GVariant> = cast(parameters.ptr)\n        let timeout: gint = gint(timeout_msec)\n        let fdListPtr: UnsafeMutablePointer<GUnixFDList> = cast(fd_list.ptr)\n        let outFdListPtr: UnsafeMutablePointer<UnsafeMutablePointer<GUnixFDList>?> = cast(out_fd_list.ptr)\n        let cancellablePtr: UnsafeMutablePointer<GCancellable> = cast(cancellable.ptr)\n        let rv = g_dbus_proxy_call_with_unix_fd_list_sync(ptrPtr, method_name, parametersPtr, flags, timeout, fdListPtr, outFdListPtr, cancellablePtr, \&error)/
