(
s.waitForBoot {
    // Define a visual synth
    SynthDef(\visual, {
        |out=0, freq=1, amp=0.5|
        var env = EnvGen.kr(Env.perc(0.01, 0.3), doneAction: 2);
        var sig = SinOsc.kr(freq) * env * amp;
        Out.kr(out, sig);
    }).add;

    // Schedule the visual pattern
    Pbind(
        \instrument, \visual,
        \freq, Pseq([1, 2, 3, 4, 5, 6, 7, 8], inf),
        \dur, 0.5
    ).play;
};
)