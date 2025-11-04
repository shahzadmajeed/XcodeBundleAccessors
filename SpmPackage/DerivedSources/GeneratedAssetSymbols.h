#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "envelopeImage" asset catalog image resource.
static NSString * const ACImageNameEnvelopeImage AC_SWIFT_PRIVATE = @"envelopeImage";

/// The "globeImage" asset catalog image resource.
static NSString * const ACImageNameGlobeImage AC_SWIFT_PRIVATE = @"globeImage";

/// The "moneyBagDarkImage" asset catalog image resource.
static NSString * const ACImageNameMoneyBagDarkImage AC_SWIFT_PRIVATE = @"moneyBagDarkImage";

/// The "moneyBagLightImage" asset catalog image resource.
static NSString * const ACImageNameMoneyBagLightImage AC_SWIFT_PRIVATE = @"moneyBagLightImage";

/// The "scoreboardDarkImage" asset catalog image resource.
static NSString * const ACImageNameScoreboardDarkImage AC_SWIFT_PRIVATE = @"scoreboardDarkImage";

/// The "triangleLeftRedLightImage" asset catalog image resource.
static NSString * const ACImageNameTriangleLeftRedLightImage AC_SWIFT_PRIVATE = @"triangleLeftRedLightImage";

#undef AC_SWIFT_PRIVATE
