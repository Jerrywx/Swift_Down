
@interface CIColor : NSObject <NSSecureCoding, NSCopying> {
    void *_priv;
    void *_pad[3];
}

/* --------------------------------------------------------------------------- */
/* Create a new color object. */
/* --------------------------------------------------------------------------- */
+ (instancetype)colorWithCGColor:(CGColorRef)c;

+ (instancetype)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a;
+ (instancetype)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b;

/* Create a new color object in a given colorspace. 
 * Will return null if the colorspace is not kCGColorSpaceModelRGB. */
+ (nullable instancetype)colorWithRed:(CGFloat)r 
								green:(CGFloat)g 
								 blue:(CGFloat)b 
								alpha:(CGFloat)a 
						   colorSpace:(CGColorSpaceRef)colorSpace;

+ (nullable instancetype)colorWithRed:(CGFloat)r 
								green:(CGFloat)g 
								 blue:(CGFloat)b 
						   colorSpace:(CGColorSpaceRef)colorSpace;

/* Create a new color object, 'representation' should be a string in one of
 * the formats returned by the stringRepresentation method. */
+ (instancetype)colorWithString:(NSString *)representation;


/* --------------------------------------------------------------------------- */
/* Initialize a new color object. */
/* --------------------------------------------------------------------------- */
/// 使用 CGColorRef 初始化
- (instancetype)initWithCGColor:(CGColorRef)c;

- (instancetype)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a;
- (instancetype)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b NS_AVAILABLE(10_11, 9_0);

/* Initialize a new color object in a given colorspace.
 * Will return null if the colorspace is not kCGColorSpaceModelRGB. */
- (nullable instancetype)initWithRed:(CGFloat)r 
							   green:(CGFloat)g 
								blue:(CGFloat)b 
							   alpha:(CGFloat)a 
						  colorSpace:(CGColorSpaceRef)colorSpace;

- (nullable instancetype)initWithRed:(CGFloat)r 
							   green:(CGFloat)g
								blue:(CGFloat)b 
						  colorSpace:(CGColorSpaceRef)colorSpace;


/* Return the number of color components (including alpha). */
@property (readonly) size_t numberOfComponents;

/* Return the color components (including alpha). */
@property (readonly) const CGFloat *components;

/// 色彩空间
@property (readonly) CGColorSpaceRef colorSpace;

/// RGCA
@property (readonly) CGFloat red;
@property (readonly) CGFloat green;
@property (readonly) CGFloat blue;
@property (readonly) CGFloat alpha;

///
@property (readonly) NSString *stringRepresentation;

/* --------------------------------------------------------------------------- */
/* Some convenience methods to create CIColors in the sRGB colorspace. */
/* --------------------------------------------------------------------------- */
+ (instancetype)blackColor NS_AVAILABLE(10_12, 10_0);
+ (instancetype)whiteColor NS_AVAILABLE(10_12, 10_0);
+ (instancetype)grayColor NS_AVAILABLE(10_12, 10_0);
+ (instancetype)redColor NS_AVAILABLE(10_12, 10_0);
+ (instancetype)greenColor NS_AVAILABLE(10_12, 10_0);
+ (instancetype)blueColor NS_AVAILABLE(10_12, 10_0);
+ (instancetype)cyanColor NS_AVAILABLE(10_12, 10_0);
+ (instancetype)magentaColor NS_AVAILABLE(10_12, 10_0);
+ (instancetype)yellowColor NS_AVAILABLE(10_12, 10_0);
+ (instancetype)clearColor NS_AVAILABLE(10_12, 10_0);

@end
