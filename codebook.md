# Code book for Accelerometers Dataset

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tacc-xyz and tgyro-xyz. These time domain
signals (prefix 't' to denote time) were captured at a constant rate of
50 Hz. Then they were filtered using a median filter and a 3rd order low
pass butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and gravity
acceleration signals (tbodyacc-xyz and tgravityacc-xyz) using another low
pass butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived
in time to obtain Jerk signals (tbodyaccjerk-xyz and tbodygyrojerk-xyz). also
the magnitude of these three-dimensional signals were calculated using the
Euclidean norm (tbodyaccmag, tgravityaccmag, tbodyaccjerkmag, tbodygyromag,
tbodygyrojerkmag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals
producing fbodyacc-xyz, fbodyaccjerk-xyz, fbodygyro-xyz, fbodyaccjerkmag,
fbodygyromag, fbodygyrojerkmag. (Note the 'f' to indicate frequency domain
signals). 

These signals were used to estimate variables of the feature vector for each
pattern: '-xyz' is used to denote 3-axial signals in the X, Y and Z directions.

tbodyacc-xyz
tgravityacc-xyz
tbodyaccjerk-xyz
tbodygyro-xyz
tbodygyrojerk-xyz
tbodyaccmag
tgravityaccmag
tbodyaccjerkmag
tbodygyromag
tbodygyrojerkmag
fbodyacc-xyz
fbodyaccjerk-xyz
fbodygyro-xyz
fbodyaccmag
fbodyaccjerkmag
fbodygyromag
fbodygyrojerkmag

The set of variables that were estimated from these signals are: 

mean: mean value
std: Standard deviation

