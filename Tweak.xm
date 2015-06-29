@interface TUTelephonyCall

- (id)destinationID;
- (void)disconnect;
- (bool)isOutgoing;
- (bool)isBlocked;

@end

%hook TUCallCenter

- (void)handleCallStatusChanged:(TUTelephonyCall*)call userInfo:(id)arg2 {
    if ([call isBlocked]) {
        [call disconnect];
        return;
    }
    %orig;
}

%end