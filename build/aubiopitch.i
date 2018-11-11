# 1 "/root/Bela/projects/bela-game/aubiopitch.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "/root/Bela/projects/bela-game/aubiopitch.c"
# 21 "/root/Bela/projects/bela-game/aubiopitch.c"
# 1 "/usr/local/include/aubio/aubio.h" 1 3
# 172 "/usr/local/include/aubio/aubio.h" 3
# 1 "/usr/local/include/aubio/types.h" 1 3
# 41 "/usr/local/include/aubio/types.h" 3

# 41 "/usr/local/include/aubio/types.h" 3
typedef float smpl_t;
# 51 "/usr/local/include/aubio/types.h" 3
typedef double lsmp_t;
# 60 "/usr/local/include/aubio/types.h" 3
typedef unsigned int uint_t;

typedef int sint_t;

typedef char char_t;
# 173 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/fvec.h" 1 3
# 67 "/usr/local/include/aubio/fvec.h" 3
typedef struct {
  uint_t length;
  smpl_t *data;
} fvec_t;






fvec_t * new_fvec(uint_t length);






void del_fvec(fvec_t *s);







smpl_t fvec_get_sample(const fvec_t *s, uint_t position);
# 101 "/usr/local/include/aubio/fvec.h" 3
void fvec_set_sample(fvec_t *s, smpl_t data, uint_t position);






smpl_t * fvec_get_data(const fvec_t *s);






void fvec_print(const fvec_t *s);







void fvec_set_all (fvec_t *s, smpl_t val);






void fvec_zeros(fvec_t *s);






void fvec_ones(fvec_t *s);






void fvec_rev(fvec_t *s);
# 155 "/usr/local/include/aubio/fvec.h" 3
void fvec_weight(fvec_t *s, const fvec_t *weight);







void fvec_copy(const fvec_t *s, fvec_t *t);
# 172 "/usr/local/include/aubio/fvec.h" 3
void fvec_weighted_copy(const fvec_t *in, const fvec_t *weight, fvec_t *out);
# 174 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/cvec.h" 1 3
# 63 "/usr/local/include/aubio/cvec.h" 3
typedef struct {
  uint_t length;
  smpl_t *norm;
  smpl_t *phas;
} cvec_t;
# 80 "/usr/local/include/aubio/cvec.h" 3
cvec_t * new_cvec(uint_t length);






void del_cvec(cvec_t *s);
# 101 "/usr/local/include/aubio/cvec.h" 3
void cvec_norm_set_sample (cvec_t *s, smpl_t val, uint_t position);
# 115 "/usr/local/include/aubio/cvec.h" 3
void cvec_phas_set_sample (cvec_t *s, smpl_t val, uint_t position);
# 128 "/usr/local/include/aubio/cvec.h" 3
smpl_t cvec_norm_get_sample (cvec_t *s, uint_t position);
# 142 "/usr/local/include/aubio/cvec.h" 3
smpl_t cvec_phas_get_sample (cvec_t *s, uint_t position);
# 153 "/usr/local/include/aubio/cvec.h" 3
smpl_t * cvec_norm_get_data (const cvec_t *s);
# 165 "/usr/local/include/aubio/cvec.h" 3
smpl_t * cvec_phas_get_data (const cvec_t *s);






void cvec_print(const cvec_t *s);







void cvec_copy(const cvec_t *s, cvec_t *t);







void cvec_norm_set_all (cvec_t *s, smpl_t val);






void cvec_norm_zeros(cvec_t *s);






void cvec_norm_ones(cvec_t *s);







void cvec_phas_set_all (cvec_t *s, smpl_t val);






void cvec_phas_zeros(cvec_t *s);






void cvec_phas_ones(cvec_t *s);






void cvec_zeros(cvec_t *s);
# 241 "/usr/local/include/aubio/cvec.h" 3
void cvec_logmag(cvec_t *s, smpl_t lambda);
# 175 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/lvec.h" 1 3
# 43 "/usr/local/include/aubio/lvec.h" 3
typedef struct {
  uint_t length;
  lsmp_t *data;
} lvec_t;






lvec_t * new_lvec(uint_t length);





void del_lvec(lvec_t *s);







lsmp_t lvec_get_sample(lvec_t *s, uint_t position);
# 76 "/usr/local/include/aubio/lvec.h" 3
void lvec_set_sample(lvec_t *s, lsmp_t data, uint_t position);






lsmp_t * lvec_get_data(const lvec_t *s);






void lvec_print(const lvec_t *s);







void lvec_set_all(lvec_t *s, smpl_t val);






void lvec_zeros(lvec_t *s);






void lvec_ones(lvec_t *s);
# 176 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/fmat.h" 1 3
# 40 "/usr/local/include/aubio/fmat.h" 3
typedef struct {
  uint_t length;
  uint_t height;
  smpl_t **data;
} fmat_t;







fmat_t * new_fmat(uint_t height, uint_t length);






void del_fmat(fmat_t *s);
# 68 "/usr/local/include/aubio/fmat.h" 3
smpl_t fmat_get_sample(const fmat_t *s, uint_t channel, uint_t position);
# 78 "/usr/local/include/aubio/fmat.h" 3
void fmat_set_sample(fmat_t *s, smpl_t data, uint_t channel, uint_t position);
# 87 "/usr/local/include/aubio/fmat.h" 3
void fmat_get_channel (const fmat_t *s, uint_t channel, fvec_t *output);







smpl_t * fmat_get_channel_data (const fmat_t *s, uint_t channel);






smpl_t ** fmat_get_data(const fmat_t *s);






void fmat_print(const fmat_t *s);







void fmat_set(fmat_t *s, smpl_t val);






void fmat_zeros(fmat_t *s);






void fmat_ones(fmat_t *s);






void fmat_rev(fmat_t *s);
# 149 "/usr/local/include/aubio/fmat.h" 3
void fmat_weight(fmat_t *s, const fmat_t *weight);







void fmat_copy(const fmat_t *s, fmat_t *t);
# 166 "/usr/local/include/aubio/fmat.h" 3
void fmat_vecmul(const fmat_t *s, const fvec_t *scale, fvec_t *output);
# 177 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/musicutils.h" 1 3
# 38 "/usr/local/include/aubio/musicutils.h" 3
fvec_t *new_aubio_window (char_t * window_type, uint_t size);
# 63 "/usr/local/include/aubio/musicutils.h" 3
uint_t fvec_set_window (fvec_t * window, char_t * window_type);
# 75 "/usr/local/include/aubio/musicutils.h" 3
smpl_t aubio_unwrap2pi (smpl_t phase);


smpl_t aubio_bintomidi (smpl_t bin, smpl_t samplerate, smpl_t fftsize);


smpl_t aubio_miditobin (smpl_t midi, smpl_t samplerate, smpl_t fftsize);


smpl_t aubio_bintofreq (smpl_t bin, smpl_t samplerate, smpl_t fftsize);


smpl_t aubio_freqtobin (smpl_t freq, smpl_t samplerate, smpl_t fftsize);


smpl_t aubio_freqtomidi (smpl_t freq);


smpl_t aubio_miditofreq (smpl_t midi);







void aubio_cleanup (void);
# 113 "/usr/local/include/aubio/musicutils.h" 3
smpl_t aubio_zero_crossing_rate (fvec_t * v);
# 124 "/usr/local/include/aubio/musicutils.h" 3
smpl_t aubio_level_lin (const fvec_t * v);
# 137 "/usr/local/include/aubio/musicutils.h" 3
smpl_t aubio_db_spl (const fvec_t * v);
# 147 "/usr/local/include/aubio/musicutils.h" 3
uint_t aubio_silence_detection (const fvec_t * v, smpl_t threshold);
# 157 "/usr/local/include/aubio/musicutils.h" 3
smpl_t aubio_level_detection (const fvec_t * v, smpl_t threshold);







void fvec_clamp(fvec_t *in, smpl_t absmax);
# 178 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/vecutils.h" 1 3
# 39 "/usr/local/include/aubio/vecutils.h" 3
void fvec_exp (fvec_t *s);






void fvec_cos (fvec_t *s);






void fvec_sin (fvec_t *s);






void fvec_abs (fvec_t *s);






void fvec_sqrt (fvec_t *s);






void fvec_log10 (fvec_t *s);






void fvec_log (fvec_t *s);






void fvec_floor (fvec_t *s);






void fvec_ceil (fvec_t *s);






void fvec_round (fvec_t *s);







void fvec_pow (fvec_t *s, smpl_t pow);
# 179 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/temporal/resampler.h" 1 3
# 38 "/usr/local/include/aubio/temporal/resampler.h" 3
typedef struct _aubio_resampler_t aubio_resampler_t;







aubio_resampler_t *new_aubio_resampler (smpl_t ratio, uint_t type);


void del_aubio_resampler (aubio_resampler_t * s);
# 58 "/usr/local/include/aubio/temporal/resampler.h" 3
void aubio_resampler_do (aubio_resampler_t * s, const fvec_t * input,
    fvec_t * output);
# 180 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/temporal/filter.h" 1 3
# 72 "/usr/local/include/aubio/temporal/filter.h" 3
typedef struct _aubio_filter_t aubio_filter_t;







void aubio_filter_do (aubio_filter_t * f, fvec_t * in);
# 89 "/usr/local/include/aubio/temporal/filter.h" 3
void aubio_filter_do_outplace (aubio_filter_t * f, const fvec_t * in, fvec_t * out);
# 98 "/usr/local/include/aubio/temporal/filter.h" 3
void aubio_filter_do_filtfilt (aubio_filter_t * f, fvec_t * in, fvec_t * tmp);
# 107 "/usr/local/include/aubio/temporal/filter.h" 3
lvec_t *aubio_filter_get_feedback (const aubio_filter_t * f);
# 116 "/usr/local/include/aubio/temporal/filter.h" 3
lvec_t *aubio_filter_get_feedforward (const aubio_filter_t * f);
# 125 "/usr/local/include/aubio/temporal/filter.h" 3
uint_t aubio_filter_get_order (const aubio_filter_t * f);
# 134 "/usr/local/include/aubio/temporal/filter.h" 3
uint_t aubio_filter_get_samplerate (const aubio_filter_t * f);
# 144 "/usr/local/include/aubio/temporal/filter.h" 3
uint_t aubio_filter_set_samplerate (aubio_filter_t * f, uint_t samplerate);






void aubio_filter_do_reset (aubio_filter_t * f);
# 163 "/usr/local/include/aubio/temporal/filter.h" 3
aubio_filter_t *new_aubio_filter (uint_t order);






void del_aubio_filter (aubio_filter_t * f);
# 181 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/temporal/biquad.h" 1 3
# 56 "/usr/local/include/aubio/temporal/biquad.h" 3
uint_t aubio_filter_set_biquad (aubio_filter_t * f, lsmp_t b0, lsmp_t b1,
    lsmp_t b2, lsmp_t a1, lsmp_t a2);
# 68 "/usr/local/include/aubio/temporal/biquad.h" 3
aubio_filter_t *new_aubio_filter_biquad (lsmp_t b0, lsmp_t b1, lsmp_t b2,
    lsmp_t a1, lsmp_t a2);
# 182 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/temporal/a_weighting.h" 1 3
# 72 "/usr/local/include/aubio/temporal/a_weighting.h" 3
aubio_filter_t *new_aubio_filter_a_weighting (uint_t samplerate);
# 82 "/usr/local/include/aubio/temporal/a_weighting.h" 3
uint_t aubio_filter_set_a_weighting (aubio_filter_t * f, uint_t samplerate);
# 183 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/temporal/c_weighting.h" 1 3
# 72 "/usr/local/include/aubio/temporal/c_weighting.h" 3
aubio_filter_t *new_aubio_filter_c_weighting (uint_t samplerate);
# 82 "/usr/local/include/aubio/temporal/c_weighting.h" 3
uint_t aubio_filter_set_c_weighting (aubio_filter_t * f, uint_t samplerate);
# 184 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/spectral/fft.h" 1 3
# 46 "/usr/local/include/aubio/spectral/fft.h" 3
typedef struct _aubio_fft_t aubio_fft_t;






aubio_fft_t * new_aubio_fft (uint_t size);





void del_aubio_fft(aubio_fft_t * s);
# 68 "/usr/local/include/aubio/spectral/fft.h" 3
void aubio_fft_do (aubio_fft_t *s, const fvec_t * input, cvec_t * spectrum);







void aubio_fft_rdo (aubio_fft_t *s, const cvec_t * spectrum, fvec_t * output);
# 85 "/usr/local/include/aubio/spectral/fft.h" 3
void aubio_fft_do_complex (aubio_fft_t *s, const fvec_t * input, fvec_t * compspec);







void aubio_fft_rdo_complex (aubio_fft_t *s, const fvec_t * compspec, fvec_t * output);







void aubio_fft_get_spectrum(const fvec_t * compspec, cvec_t * spectrum);






void aubio_fft_get_realimag(const cvec_t * spectrum, fvec_t * compspec);







void aubio_fft_get_phas(const fvec_t * compspec, cvec_t * spectrum);






void aubio_fft_get_imag(const cvec_t * spectrum, fvec_t * compspec);







void aubio_fft_get_norm(const fvec_t * compspec, cvec_t * spectrum);






void aubio_fft_get_real(const cvec_t * spectrum, fvec_t * compspec);
# 185 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/spectral/dct.h" 1 3
# 46 "/usr/local/include/aubio/spectral/dct.h" 3
typedef struct _aubio_dct_t aubio_dct_t;






aubio_dct_t * new_aubio_dct(uint_t size);
# 62 "/usr/local/include/aubio/spectral/dct.h" 3
void aubio_dct_do (aubio_dct_t *s, const fvec_t * input, fvec_t * dct_output);
# 71 "/usr/local/include/aubio/spectral/dct.h" 3
void aubio_dct_rdo (aubio_dct_t *s, const fvec_t * input, fvec_t * idct_output);







void del_aubio_dct (aubio_dct_t *s);
# 186 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/spectral/phasevoc.h" 1 3
# 42 "/usr/local/include/aubio/spectral/phasevoc.h" 3
typedef struct _aubio_pvoc_t aubio_pvoc_t;







aubio_pvoc_t * new_aubio_pvoc (uint_t win_s, uint_t hop_s);





void del_aubio_pvoc(aubio_pvoc_t *pv);
# 70 "/usr/local/include/aubio/spectral/phasevoc.h" 3
void aubio_pvoc_do(aubio_pvoc_t *pv, const fvec_t *in, cvec_t * fftgrain);
# 83 "/usr/local/include/aubio/spectral/phasevoc.h" 3
void aubio_pvoc_rdo(aubio_pvoc_t *pv, cvec_t * fftgrain, fvec_t *out);






uint_t aubio_pvoc_get_win(aubio_pvoc_t* pv);





uint_t aubio_pvoc_get_hop(aubio_pvoc_t* pv);
# 106 "/usr/local/include/aubio/spectral/phasevoc.h" 3
uint_t aubio_pvoc_set_window(aubio_pvoc_t *pv, const char_t *window_type);
# 187 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/spectral/filterbank.h" 1 3
# 45 "/usr/local/include/aubio/spectral/filterbank.h" 3
typedef struct _aubio_filterbank_t aubio_filterbank_t;







aubio_filterbank_t *new_aubio_filterbank (uint_t n_filters, uint_t win_s);






void del_aubio_filterbank (aubio_filterbank_t * f);
# 69 "/usr/local/include/aubio/spectral/filterbank.h" 3
void aubio_filterbank_do (aubio_filterbank_t * f, const cvec_t * in, fvec_t * out);






fmat_t *aubio_filterbank_get_coeffs (const aubio_filterbank_t * f);







uint_t aubio_filterbank_set_coeffs (aubio_filterbank_t * f, const fmat_t * filters);
# 188 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/spectral/filterbank_mel.h" 1 3
# 52 "/usr/local/include/aubio/spectral/filterbank_mel.h" 3
uint_t aubio_filterbank_set_triangle_bands (aubio_filterbank_t * fb,
    const fvec_t * freqs, smpl_t samplerate);
# 65 "/usr/local/include/aubio/spectral/filterbank_mel.h" 3
uint_t aubio_filterbank_set_mel_coeffs_slaney (aubio_filterbank_t * fb,
    smpl_t samplerate);
# 189 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/spectral/mfcc.h" 1 3
# 46 "/usr/local/include/aubio/spectral/mfcc.h" 3
typedef struct _aubio_mfcc_t aubio_mfcc_t;
# 56 "/usr/local/include/aubio/spectral/mfcc.h" 3
aubio_mfcc_t *new_aubio_mfcc (uint_t buf_size,
    uint_t n_filters, uint_t n_coeffs, uint_t samplerate);






void del_aubio_mfcc (aubio_mfcc_t * mf);
# 73 "/usr/local/include/aubio/spectral/mfcc.h" 3
void aubio_mfcc_do (aubio_mfcc_t * mf, const cvec_t * in, fvec_t * out);
# 190 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/spectral/specdesc.h" 1 3
# 163 "/usr/local/include/aubio/spectral/specdesc.h" 3
typedef struct _aubio_specdesc_t aubio_specdesc_t;
# 174 "/usr/local/include/aubio/spectral/specdesc.h" 3
void aubio_specdesc_do (aubio_specdesc_t * o, const cvec_t * fftgrain,
    fvec_t * desc);
# 191 "/usr/local/include/aubio/spectral/specdesc.h" 3
aubio_specdesc_t *new_aubio_specdesc (const char_t * method, uint_t buf_size);






void del_aubio_specdesc (aubio_specdesc_t * o);
# 191 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/spectral/awhitening.h" 1 3
# 51 "/usr/local/include/aubio/spectral/awhitening.h" 3
typedef struct _aubio_spectral_whitening_t aubio_spectral_whitening_t;







void aubio_spectral_whitening_do (aubio_spectral_whitening_t * o,
                                  cvec_t * fftgrain);
# 69 "/usr/local/include/aubio/spectral/awhitening.h" 3
aubio_spectral_whitening_t *new_aubio_spectral_whitening (uint_t buf_size,
                                                          uint_t hop_size,
                                                          uint_t samplerate);






void aubio_spectral_whitening_reset (aubio_spectral_whitening_t * o);







uint_t aubio_spectral_whitening_set_relax_time (aubio_spectral_whitening_t * o,
    smpl_t relax_time);







smpl_t aubio_spectral_whitening_get_relax_time (aubio_spectral_whitening_t * o);







uint_t aubio_spectral_whitening_set_floor (aubio_spectral_whitening_t * o,
    smpl_t floor);







smpl_t aubio_spectral_whitening_get_floor (aubio_spectral_whitening_t * o);






void del_aubio_spectral_whitening (aubio_spectral_whitening_t * o);
# 192 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/spectral/tss.h" 1 3
# 47 "/usr/local/include/aubio/spectral/tss.h" 3
typedef struct _aubio_tss_t aubio_tss_t;







aubio_tss_t *new_aubio_tss (uint_t buf_size, uint_t hop_size);






void del_aubio_tss (aubio_tss_t * o);
# 72 "/usr/local/include/aubio/spectral/tss.h" 3
void aubio_tss_do (aubio_tss_t * o, const cvec_t * input, cvec_t * trans,
    cvec_t * stead);







uint_t aubio_tss_set_threshold (aubio_tss_t * o, smpl_t thrs);







uint_t aubio_tss_set_alpha (aubio_tss_t * o, smpl_t alpha);







uint_t aubio_tss_set_beta (aubio_tss_t * o, smpl_t beta);
# 193 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/pitch/pitch.h" 1 3
# 106 "/usr/local/include/aubio/pitch/pitch.h" 3
typedef struct _aubio_pitch_t aubio_pitch_t;
# 115 "/usr/local/include/aubio/pitch/pitch.h" 3
void aubio_pitch_do (aubio_pitch_t * o, const fvec_t * in, fvec_t * out);







uint_t aubio_pitch_set_tolerance (aubio_pitch_t * o, smpl_t tol);







smpl_t aubio_pitch_get_tolerance (aubio_pitch_t * o);






void del_aubio_pitch (aubio_pitch_t * o);
# 150 "/usr/local/include/aubio/pitch/pitch.h" 3
aubio_pitch_t *new_aubio_pitch (const char_t * method,
    uint_t buf_size, uint_t hop_size, uint_t samplerate);
# 163 "/usr/local/include/aubio/pitch/pitch.h" 3
uint_t aubio_pitch_set_unit (aubio_pitch_t * o, const char_t * mode);
# 173 "/usr/local/include/aubio/pitch/pitch.h" 3
uint_t aubio_pitch_set_silence (aubio_pitch_t * o, smpl_t silence);
# 182 "/usr/local/include/aubio/pitch/pitch.h" 3
smpl_t aubio_pitch_get_silence (aubio_pitch_t * o);
# 191 "/usr/local/include/aubio/pitch/pitch.h" 3
smpl_t aubio_pitch_get_confidence (aubio_pitch_t * o);
# 194 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/onset/onset.h" 1 3
# 50 "/usr/local/include/aubio/onset/onset.h" 3
typedef struct _aubio_onset_t aubio_onset_t;
# 62 "/usr/local/include/aubio/onset/onset.h" 3
aubio_onset_t * new_aubio_onset (const char_t * method,
    uint_t buf_size, uint_t hop_size, uint_t samplerate);
# 91 "/usr/local/include/aubio/onset/onset.h" 3
void aubio_onset_do (aubio_onset_t *o, const fvec_t * input, fvec_t * onset);
# 100 "/usr/local/include/aubio/onset/onset.h" 3
uint_t aubio_onset_get_last (const aubio_onset_t *o);
# 109 "/usr/local/include/aubio/onset/onset.h" 3
smpl_t aubio_onset_get_last_s (const aubio_onset_t *o);
# 118 "/usr/local/include/aubio/onset/onset.h" 3
smpl_t aubio_onset_get_last_ms (const aubio_onset_t *o);
# 128 "/usr/local/include/aubio/onset/onset.h" 3
uint_t aubio_onset_set_awhitening(aubio_onset_t * o, uint_t enable);
# 137 "/usr/local/include/aubio/onset/onset.h" 3
smpl_t aubio_onset_get_awhitening(aubio_onset_t * o);
# 147 "/usr/local/include/aubio/onset/onset.h" 3
uint_t aubio_onset_set_compression(aubio_onset_t *o, smpl_t lambda);
# 156 "/usr/local/include/aubio/onset/onset.h" 3
smpl_t aubio_onset_get_compression(aubio_onset_t *o);







uint_t aubio_onset_set_silence(aubio_onset_t * o, smpl_t silence);
# 173 "/usr/local/include/aubio/onset/onset.h" 3
smpl_t aubio_onset_get_silence(const aubio_onset_t * o);







smpl_t aubio_onset_get_descriptor (const aubio_onset_t *o);







smpl_t aubio_onset_get_thresholded_descriptor (const aubio_onset_t *o);







uint_t aubio_onset_set_threshold(aubio_onset_t * o, smpl_t threshold);
# 206 "/usr/local/include/aubio/onset/onset.h" 3
uint_t aubio_onset_set_minioi(aubio_onset_t * o, uint_t minioi);
# 215 "/usr/local/include/aubio/onset/onset.h" 3
uint_t aubio_onset_set_minioi_s(aubio_onset_t * o, smpl_t minioi);
# 224 "/usr/local/include/aubio/onset/onset.h" 3
uint_t aubio_onset_set_minioi_ms(aubio_onset_t * o, smpl_t minioi);
# 233 "/usr/local/include/aubio/onset/onset.h" 3
uint_t aubio_onset_set_delay(aubio_onset_t * o, uint_t delay);
# 242 "/usr/local/include/aubio/onset/onset.h" 3
uint_t aubio_onset_set_delay_s(aubio_onset_t * o, smpl_t delay);
# 251 "/usr/local/include/aubio/onset/onset.h" 3
uint_t aubio_onset_set_delay_ms(aubio_onset_t * o, smpl_t delay);
# 260 "/usr/local/include/aubio/onset/onset.h" 3
uint_t aubio_onset_get_minioi(const aubio_onset_t * o);
# 269 "/usr/local/include/aubio/onset/onset.h" 3
smpl_t aubio_onset_get_minioi_s(const aubio_onset_t * o);
# 278 "/usr/local/include/aubio/onset/onset.h" 3
smpl_t aubio_onset_get_minioi_ms(const aubio_onset_t * o);
# 287 "/usr/local/include/aubio/onset/onset.h" 3
uint_t aubio_onset_get_delay(const aubio_onset_t * o);
# 296 "/usr/local/include/aubio/onset/onset.h" 3
smpl_t aubio_onset_get_delay_s(const aubio_onset_t * o);
# 305 "/usr/local/include/aubio/onset/onset.h" 3
smpl_t aubio_onset_get_delay_ms(const aubio_onset_t * o);







smpl_t aubio_onset_get_threshold(const aubio_onset_t * o);
# 323 "/usr/local/include/aubio/onset/onset.h" 3
uint_t aubio_onset_set_default_parameters (aubio_onset_t * o, const char_t * onset_mode);
# 334 "/usr/local/include/aubio/onset/onset.h" 3
void aubio_onset_reset(aubio_onset_t * o);






void del_aubio_onset(aubio_onset_t * o);
# 195 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/tempo/tempo.h" 1 3
# 41 "/usr/local/include/aubio/tempo/tempo.h" 3
typedef struct _aubio_tempo_t aubio_tempo_t;
# 53 "/usr/local/include/aubio/tempo/tempo.h" 3
aubio_tempo_t * new_aubio_tempo (const char_t * method,
    uint_t buf_size, uint_t hop_size, uint_t samplerate);
# 63 "/usr/local/include/aubio/tempo/tempo.h" 3
void aubio_tempo_do (aubio_tempo_t *o, const fvec_t * input, fvec_t * tempo);






uint_t aubio_tempo_get_last (aubio_tempo_t *o);






smpl_t aubio_tempo_get_last_s (aubio_tempo_t *o);






smpl_t aubio_tempo_get_last_ms (aubio_tempo_t *o);
# 94 "/usr/local/include/aubio/tempo/tempo.h" 3
uint_t aubio_tempo_set_silence(aubio_tempo_t * o, smpl_t silence);
# 103 "/usr/local/include/aubio/tempo/tempo.h" 3
smpl_t aubio_tempo_get_silence(aubio_tempo_t * o);
# 113 "/usr/local/include/aubio/tempo/tempo.h" 3
uint_t aubio_tempo_set_threshold(aubio_tempo_t * o, smpl_t threshold);
# 122 "/usr/local/include/aubio/tempo/tempo.h" 3
smpl_t aubio_tempo_get_threshold(aubio_tempo_t * o);
# 132 "/usr/local/include/aubio/tempo/tempo.h" 3
smpl_t aubio_tempo_get_period (aubio_tempo_t * bt);
# 142 "/usr/local/include/aubio/tempo/tempo.h" 3
smpl_t aubio_tempo_get_period_s (aubio_tempo_t * bt);
# 151 "/usr/local/include/aubio/tempo/tempo.h" 3
smpl_t aubio_tempo_get_bpm(aubio_tempo_t * o);
# 161 "/usr/local/include/aubio/tempo/tempo.h" 3
smpl_t aubio_tempo_get_confidence(aubio_tempo_t * o);







uint_t aubio_tempo_set_tatum_signature(aubio_tempo_t *o, uint_t signature);
# 178 "/usr/local/include/aubio/tempo/tempo.h" 3
uint_t aubio_tempo_was_tatum(aubio_tempo_t *o);






smpl_t aubio_tempo_get_last_tatum(aubio_tempo_t *o);
# 194 "/usr/local/include/aubio/tempo/tempo.h" 3
uint_t aubio_tempo_get_delay(aubio_tempo_t * o);
# 203 "/usr/local/include/aubio/tempo/tempo.h" 3
smpl_t aubio_tempo_get_delay_s(aubio_tempo_t * o);
# 212 "/usr/local/include/aubio/tempo/tempo.h" 3
smpl_t aubio_tempo_get_delay_ms(aubio_tempo_t * o);
# 222 "/usr/local/include/aubio/tempo/tempo.h" 3
uint_t aubio_tempo_set_delay(aubio_tempo_t * o, sint_t delay);
# 232 "/usr/local/include/aubio/tempo/tempo.h" 3
uint_t aubio_tempo_set_delay_s(aubio_tempo_t * o, smpl_t delay);
# 242 "/usr/local/include/aubio/tempo/tempo.h" 3
uint_t aubio_tempo_set_delay_ms(aubio_tempo_t * o, smpl_t delay);






void del_aubio_tempo(aubio_tempo_t * o);
# 196 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/notes/notes.h" 1 3
# 35 "/usr/local/include/aubio/notes/notes.h" 3
typedef struct _aubio_notes_t aubio_notes_t;
# 47 "/usr/local/include/aubio/notes/notes.h" 3
aubio_notes_t * new_aubio_notes (const char_t * method,
    uint_t buf_size, uint_t hop_size, uint_t samplerate);






void del_aubio_notes(aubio_notes_t * o);
# 69 "/usr/local/include/aubio/notes/notes.h" 3
void aubio_notes_do (aubio_notes_t *o, const fvec_t * input, fvec_t * output);
# 79 "/usr/local/include/aubio/notes/notes.h" 3
uint_t aubio_notes_set_silence(aubio_notes_t * o, smpl_t silence);
# 88 "/usr/local/include/aubio/notes/notes.h" 3
smpl_t aubio_notes_get_silence(const aubio_notes_t * o);
# 97 "/usr/local/include/aubio/notes/notes.h" 3
smpl_t aubio_notes_get_minioi_ms(const aubio_notes_t *o);
# 107 "/usr/local/include/aubio/notes/notes.h" 3
uint_t aubio_notes_set_minioi_ms (aubio_notes_t *o, smpl_t minioi_ms);
# 197 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/io/source.h" 1 3
# 71 "/usr/local/include/aubio/io/source.h" 3
typedef struct _aubio_source_t aubio_source_t;
# 88 "/usr/local/include/aubio/io/source.h" 3
aubio_source_t * new_aubio_source(const char_t * uri, uint_t samplerate, uint_t hop_size);
# 102 "/usr/local/include/aubio/io/source.h" 3
void aubio_source_do(aubio_source_t * s, fvec_t * read_to, uint_t * read);
# 116 "/usr/local/include/aubio/io/source.h" 3
void aubio_source_do_multi(aubio_source_t * s, fmat_t * read_to, uint_t * read);
# 126 "/usr/local/include/aubio/io/source.h" 3
uint_t aubio_source_get_samplerate(aubio_source_t * s);
# 136 "/usr/local/include/aubio/io/source.h" 3
uint_t aubio_source_get_channels (aubio_source_t * s);
# 148 "/usr/local/include/aubio/io/source.h" 3
uint_t aubio_source_seek (aubio_source_t * s, uint_t pos);
# 158 "/usr/local/include/aubio/io/source.h" 3
uint_t aubio_source_get_duration (aubio_source_t * s);
# 169 "/usr/local/include/aubio/io/source.h" 3
uint_t aubio_source_close (aubio_source_t *s);
# 178 "/usr/local/include/aubio/io/source.h" 3
void del_aubio_source(aubio_source_t * s);
# 198 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/io/sink.h" 1 3
# 61 "/usr/local/include/aubio/io/sink.h" 3
typedef struct _aubio_sink_t aubio_sink_t;
# 79 "/usr/local/include/aubio/io/sink.h" 3
aubio_sink_t * new_aubio_sink(const char_t * uri, uint_t samplerate);
# 96 "/usr/local/include/aubio/io/sink.h" 3
uint_t aubio_sink_preset_samplerate(aubio_sink_t *s, uint_t samplerate);
# 113 "/usr/local/include/aubio/io/sink.h" 3
uint_t aubio_sink_preset_channels(aubio_sink_t *s, uint_t channels);
# 123 "/usr/local/include/aubio/io/sink.h" 3
uint_t aubio_sink_get_samplerate(const aubio_sink_t *s);
# 133 "/usr/local/include/aubio/io/sink.h" 3
uint_t aubio_sink_get_channels(const aubio_sink_t *s);
# 144 "/usr/local/include/aubio/io/sink.h" 3
void aubio_sink_do(aubio_sink_t * s, fvec_t * write_data, uint_t write);
# 155 "/usr/local/include/aubio/io/sink.h" 3
void aubio_sink_do_multi(aubio_sink_t * s, fmat_t * write_data, uint_t write);
# 166 "/usr/local/include/aubio/io/sink.h" 3
uint_t aubio_sink_close(aubio_sink_t * s);
# 175 "/usr/local/include/aubio/io/sink.h" 3
void del_aubio_sink(aubio_sink_t * s);
# 199 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/synth/sampler.h" 1 3
# 42 "/usr/local/include/aubio/synth/sampler.h" 3
typedef struct _aubio_sampler_t aubio_sampler_t;
# 52 "/usr/local/include/aubio/synth/sampler.h" 3
aubio_sampler_t * new_aubio_sampler(uint_t samplerate, uint_t hop_size);
# 62 "/usr/local/include/aubio/synth/sampler.h" 3
uint_t aubio_sampler_load( aubio_sampler_t * o, const char_t * uri );
# 76 "/usr/local/include/aubio/synth/sampler.h" 3
void aubio_sampler_do ( aubio_sampler_t * o, const fvec_t * input, fvec_t * output);
# 90 "/usr/local/include/aubio/synth/sampler.h" 3
void aubio_sampler_do_multi ( aubio_sampler_t * o, const fmat_t * input, fmat_t * output);
# 99 "/usr/local/include/aubio/synth/sampler.h" 3
uint_t aubio_sampler_get_playing ( const aubio_sampler_t * o );
# 109 "/usr/local/include/aubio/synth/sampler.h" 3
uint_t aubio_sampler_set_playing ( aubio_sampler_t * o, uint_t playing );
# 118 "/usr/local/include/aubio/synth/sampler.h" 3
uint_t aubio_sampler_play ( aubio_sampler_t * o );
# 127 "/usr/local/include/aubio/synth/sampler.h" 3
uint_t aubio_sampler_stop ( aubio_sampler_t * o );






void del_aubio_sampler( aubio_sampler_t * o );
# 200 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/synth/wavetable.h" 1 3
# 42 "/usr/local/include/aubio/synth/wavetable.h" 3
typedef struct _aubio_wavetable_t aubio_wavetable_t;
# 52 "/usr/local/include/aubio/synth/wavetable.h" 3
aubio_wavetable_t * new_aubio_wavetable(uint_t samplerate, uint_t hop_size);
# 62 "/usr/local/include/aubio/synth/wavetable.h" 3
uint_t aubio_wavetable_load( aubio_wavetable_t * o, const char_t * uri );
# 76 "/usr/local/include/aubio/synth/wavetable.h" 3
void aubio_wavetable_do ( aubio_wavetable_t * o, const fvec_t * input, fvec_t * output);
# 90 "/usr/local/include/aubio/synth/wavetable.h" 3
void aubio_wavetable_do_multi ( aubio_wavetable_t * o, const fmat_t * input, fmat_t * output);
# 99 "/usr/local/include/aubio/synth/wavetable.h" 3
uint_t aubio_wavetable_get_playing ( const aubio_wavetable_t * o );
# 109 "/usr/local/include/aubio/synth/wavetable.h" 3
uint_t aubio_wavetable_set_playing ( aubio_wavetable_t * o, uint_t playing );
# 118 "/usr/local/include/aubio/synth/wavetable.h" 3
uint_t aubio_wavetable_play ( aubio_wavetable_t * o );
# 127 "/usr/local/include/aubio/synth/wavetable.h" 3
uint_t aubio_wavetable_stop ( aubio_wavetable_t * o );
# 137 "/usr/local/include/aubio/synth/wavetable.h" 3
uint_t aubio_wavetable_set_freq ( aubio_wavetable_t * o, smpl_t freq );
# 146 "/usr/local/include/aubio/synth/wavetable.h" 3
smpl_t aubio_wavetable_get_freq ( const aubio_wavetable_t * o);
# 156 "/usr/local/include/aubio/synth/wavetable.h" 3
uint_t aubio_wavetable_set_amp ( aubio_wavetable_t * o, smpl_t amp );
# 165 "/usr/local/include/aubio/synth/wavetable.h" 3
smpl_t aubio_wavetable_get_amp ( const aubio_wavetable_t * o);






void del_aubio_wavetable( aubio_wavetable_t * o );
# 201 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/utils/parameter.h" 1 3
# 40 "/usr/local/include/aubio/utils/parameter.h" 3
typedef struct _aubio_parameter_t aubio_parameter_t;
# 51 "/usr/local/include/aubio/utils/parameter.h" 3
aubio_parameter_t * new_aubio_parameter(smpl_t min_value, smpl_t max_value, uint_t steps);
# 61 "/usr/local/include/aubio/utils/parameter.h" 3
uint_t aubio_parameter_set_target_value ( aubio_parameter_t * param, smpl_t value );
# 70 "/usr/local/include/aubio/utils/parameter.h" 3
smpl_t aubio_parameter_get_next_value ( aubio_parameter_t * param );
# 79 "/usr/local/include/aubio/utils/parameter.h" 3
smpl_t aubio_parameter_get_current_value ( const aubio_parameter_t * param );
# 89 "/usr/local/include/aubio/utils/parameter.h" 3
uint_t aubio_parameter_set_current_value ( aubio_parameter_t * param, smpl_t value );
# 99 "/usr/local/include/aubio/utils/parameter.h" 3
uint_t aubio_parameter_set_steps ( aubio_parameter_t * param, uint_t steps );
# 108 "/usr/local/include/aubio/utils/parameter.h" 3
uint_t aubio_parameter_get_steps ( const aubio_parameter_t * param);
# 118 "/usr/local/include/aubio/utils/parameter.h" 3
uint_t aubio_parameter_set_min_value ( aubio_parameter_t * param, smpl_t min_value );
# 127 "/usr/local/include/aubio/utils/parameter.h" 3
smpl_t aubio_parameter_get_min_value ( const aubio_parameter_t * param );
# 137 "/usr/local/include/aubio/utils/parameter.h" 3
uint_t aubio_parameter_set_max_value ( aubio_parameter_t * param, smpl_t max_value );
# 146 "/usr/local/include/aubio/utils/parameter.h" 3
smpl_t aubio_parameter_get_max_value ( const aubio_parameter_t * param );






void del_aubio_parameter( aubio_parameter_t * param );
# 202 "/usr/local/include/aubio/aubio.h" 2 3
# 1 "/usr/local/include/aubio/utils/log.h" 1 3
# 46 "/usr/local/include/aubio/utils/log.h" 3
enum aubio_log_level {
  AUBIO_LOG_ERR,
  AUBIO_LOG_INF,
  AUBIO_LOG_MSG,
  AUBIO_LOG_DBG,
  AUBIO_LOG_WRN,
  AUBIO_LOG_LAST_LEVEL,
};
# 64 "/usr/local/include/aubio/utils/log.h" 3
typedef void (*aubio_log_function_t)(sint_t level, const char_t *message, void
    *data);
# 74 "/usr/local/include/aubio/utils/log.h" 3
void aubio_log_set_function(aubio_log_function_t fun, void* data);
# 84 "/usr/local/include/aubio/utils/log.h" 3
aubio_log_function_t aubio_log_set_level_function(sint_t level,
    aubio_log_function_t fun, void* data);







void aubio_log_reset(void);
# 203 "/usr/local/include/aubio/aubio.h" 2 3
# 22 "/root/Bela/projects/bela-game/aubiopitch.c" 2
# 1 "/usr/xenomai/include/cobalt/stdio.h" 1
# 19 "/usr/xenomai/include/cobalt/stdio.h"
       
# 20 "/usr/xenomai/include/cobalt/stdio.h" 3
# 1 "/usr/include/stdio.h" 1 3 4
# 27 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 364 "/usr/include/features.h" 3 4
# 1 "/usr/include/arm-linux-gnueabihf/sys/cdefs.h" 1 3 4
# 415 "/usr/include/arm-linux-gnueabihf/sys/cdefs.h" 3 4
# 1 "/usr/include/arm-linux-gnueabihf/bits/wordsize.h" 1 3 4
# 416 "/usr/include/arm-linux-gnueabihf/sys/cdefs.h" 2 3 4
# 365 "/usr/include/features.h" 2 3 4
# 388 "/usr/include/features.h" 3 4
# 1 "/usr/include/arm-linux-gnueabihf/gnu/stubs.h" 1 3 4
# 10 "/usr/include/arm-linux-gnueabihf/gnu/stubs.h" 3 4
# 1 "/usr/include/arm-linux-gnueabihf/gnu/stubs-hard.h" 1 3 4
# 11 "/usr/include/arm-linux-gnueabihf/gnu/stubs.h" 2 3 4
# 389 "/usr/include/features.h" 2 3 4
# 28 "/usr/include/stdio.h" 2 3 4





# 1 "/usr/lib/gcc/arm-linux-gnueabihf/6/include/stddef.h" 1 3 4
# 216 "/usr/lib/gcc/arm-linux-gnueabihf/6/include/stddef.h" 3 4
typedef unsigned int size_t;
# 34 "/usr/include/stdio.h" 2 3 4

# 1 "/usr/include/arm-linux-gnueabihf/bits/types.h" 1 3 4
# 27 "/usr/include/arm-linux-gnueabihf/bits/types.h" 3 4
# 1 "/usr/include/arm-linux-gnueabihf/bits/wordsize.h" 1 3 4
# 28 "/usr/include/arm-linux-gnueabihf/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;




__extension__ typedef signed long long int __int64_t;
__extension__ typedef unsigned long long int __uint64_t;







__extension__ typedef long long int __quad_t;
__extension__ typedef unsigned long long int __u_quad_t;
# 121 "/usr/include/arm-linux-gnueabihf/bits/types.h" 3 4
# 1 "/usr/include/arm-linux-gnueabihf/bits/typesizes.h" 1 3 4
# 122 "/usr/include/arm-linux-gnueabihf/bits/types.h" 2 3 4


__extension__ typedef __u_quad_t __dev_t;
__extension__ typedef unsigned int __uid_t;
__extension__ typedef unsigned int __gid_t;
__extension__ typedef unsigned long int __ino_t;
__extension__ typedef __u_quad_t __ino64_t;
__extension__ typedef unsigned int __mode_t;
__extension__ typedef unsigned int __nlink_t;
__extension__ typedef long int __off_t;
__extension__ typedef __quad_t __off64_t;
__extension__ typedef int __pid_t;
__extension__ typedef struct { int __val[2]; } __fsid_t;
__extension__ typedef long int __clock_t;
__extension__ typedef unsigned long int __rlim_t;
__extension__ typedef __u_quad_t __rlim64_t;
__extension__ typedef unsigned int __id_t;
__extension__ typedef long int __time_t;
__extension__ typedef unsigned int __useconds_t;
__extension__ typedef long int __suseconds_t;

__extension__ typedef int __daddr_t;
__extension__ typedef int __key_t;


__extension__ typedef int __clockid_t;


__extension__ typedef void * __timer_t;


__extension__ typedef long int __blksize_t;




__extension__ typedef long int __blkcnt_t;
__extension__ typedef __quad_t __blkcnt64_t;


__extension__ typedef unsigned long int __fsblkcnt_t;
__extension__ typedef __u_quad_t __fsblkcnt64_t;


__extension__ typedef unsigned long int __fsfilcnt_t;
__extension__ typedef __u_quad_t __fsfilcnt64_t;


__extension__ typedef int __fsword_t;

__extension__ typedef int __ssize_t;


__extension__ typedef long int __syscall_slong_t;

__extension__ typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


__extension__ typedef int __intptr_t;


__extension__ typedef unsigned int __socklen_t;
# 36 "/usr/include/stdio.h" 2 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 64 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 74 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 31 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/arm-linux-gnueabihf/6/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 82 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 32 "/usr/include/libio.h" 2 3 4
# 49 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/arm-linux-gnueabihf/6/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/arm-linux-gnueabihf/6/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 50 "/usr/include/libio.h" 2 3 4
# 144 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;





typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 173 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 241 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 289 "/usr/include/libio.h" 3 4
  __off64_t _offset;







  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;

  size_t __pad5;
  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 333 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);




typedef __io_read_fn cookie_read_function_t;
typedef __io_write_fn cookie_write_function_t;
typedef __io_seek_fn cookie_seek_function_t;
typedef __io_close_fn cookie_close_function_t;


typedef struct
{
  __io_read_fn *read;
  __io_write_fn *write;
  __io_seek_fn *seek;
  __io_close_fn *close;
} _IO_cookie_io_functions_t;
typedef _IO_cookie_io_functions_t cookie_io_functions_t;

struct _IO_cookie_file;


extern void _IO_cookie_init (struct _IO_cookie_file *__cfile, int __read_write,
        void *__cookie, _IO_cookie_io_functions_t __fns);







extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 429 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 459 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 75 "/usr/include/stdio.h" 2 3 4




typedef __gnuc_va_list va_list;
# 90 "/usr/include/stdio.h" 3 4
typedef __off_t off_t;






typedef __off64_t off64_t;






typedef __ssize_t ssize_t;







typedef _G_fpos_t fpos_t;





typedef _G_fpos64_t fpos64_t;
# 166 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/arm-linux-gnueabihf/bits/stdio_lim.h" 1 3 4
# 167 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));




extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ , __leaf__));








extern FILE *tmpfile (void) ;
# 207 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile64 (void) ;



extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;





extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;
# 229 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 254 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 264 "/usr/include/stdio.h" 3 4
extern int fcloseall (void);









extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 297 "/usr/include/stdio.h" 3 4


extern FILE *fopen64 (const char *__restrict __filename,
        const char *__restrict __modes) ;
extern FILE *freopen64 (const char *__restrict __filename,
   const char *__restrict __modes,
   FILE *__restrict __stream) ;




extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) ;





extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     _IO_cookie_io_functions_t __io_funcs) __attribute__ ((__nothrow__ , __leaf__)) ;




extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__)) ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));








extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));






extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;




extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
# 465 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 524 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 552 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 563 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 596 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
# 642 "/usr/include/stdio.h" 3 4

# 651 "/usr/include/stdio.h" 3 4
extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream) ;
# 667 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 728 "/usr/include/stdio.h" 3 4
extern int fputs_unlocked (const char *__restrict __s,
      FILE *__restrict __stream);
# 739 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 775 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 794 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 817 "/usr/include/stdio.h" 3 4



extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);




extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;




extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;








extern void perror (const char *__s);






# 1 "/usr/include/arm-linux-gnueabihf/bits/sys_errlist.h" 1 3 4
# 26 "/usr/include/arm-linux-gnueabihf/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern const char *const sys_errlist[];


extern int _sys_nerr;
extern const char *const _sys_errlist[];
# 856 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
# 874 "/usr/include/stdio.h" 3 4
extern FILE *popen (const char *__command, const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));





extern char *cuserid (char *__s);




struct obstack;


extern int obstack_printf (struct obstack *__restrict __obstack,
      const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       const char *__restrict __format,
       __gnuc_va_list __args)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0)));







extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
# 935 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/arm-linux-gnueabihf/bits/stdio.h" 1 3 4
# 35 "/usr/include/arm-linux-gnueabihf/bits/stdio.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
vprintf (const char *__restrict __fmt, __gnuc_va_list __arg)
{
  return vfprintf (stdout, __fmt, __arg);
}



extern __inline __attribute__ ((__gnu_inline__)) int
getchar (void)
{
  return _IO_getc (stdin);
}




extern __inline __attribute__ ((__gnu_inline__)) int
fgetc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}





extern __inline __attribute__ ((__gnu_inline__)) int
getc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}


extern __inline __attribute__ ((__gnu_inline__)) int
getchar_unlocked (void)
{
  return (__builtin_expect (((stdin)->_IO_read_ptr >= (stdin)->_IO_read_end), 0) ? __uflow (stdin) : *(unsigned char *) (stdin)->_IO_read_ptr++);
}




extern __inline __attribute__ ((__gnu_inline__)) int
putchar (int __c)
{
  return _IO_putc (__c, stdout);
}




extern __inline __attribute__ ((__gnu_inline__)) int
fputc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}





extern __inline __attribute__ ((__gnu_inline__)) int
putc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}


extern __inline __attribute__ ((__gnu_inline__)) int
putchar_unlocked (int __c)
{
  return (__builtin_expect (((stdout)->_IO_write_ptr >= (stdout)->_IO_write_end), 0) ? __overflow (stdout, (unsigned char) (__c)) : (unsigned char) (*(stdout)->_IO_write_ptr++ = (__c)));
}





extern __inline __attribute__ ((__gnu_inline__)) __ssize_t
getline (char **__lineptr, size_t *__n, FILE *__stream)
{
  return __getdelim (__lineptr, __n, '\n', __stream);
}





extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x10) != 0);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x20) != 0);
}
# 936 "/usr/include/stdio.h" 2 3 4
# 944 "/usr/include/stdio.h" 3 4

# 21 "/usr/xenomai/include/cobalt/stdio.h" 2 3




# 1 "/usr/lib/gcc/arm-linux-gnueabihf/6/include/stddef.h" 1 3 4
# 149 "/usr/lib/gcc/arm-linux-gnueabihf/6/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 328 "/usr/lib/gcc/arm-linux-gnueabihf/6/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 426 "/usr/lib/gcc/arm-linux-gnueabihf/6/include/stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
} max_align_t;
# 26 "/usr/xenomai/include/cobalt/stdio.h" 2 3
# 1 "/usr/lib/gcc/arm-linux-gnueabihf/6/include/stdarg.h" 1 3 4
# 27 "/usr/xenomai/include/cobalt/stdio.h" 2 3
# 1 "/usr/xenomai/include/xeno_config.h" 1 3
# 28 "/usr/xenomai/include/cobalt/stdio.h" 2 3
# 1 "/usr/xenomai/include/cobalt/wrappers.h" 1 3
# 21 "/usr/xenomai/include/cobalt/wrappers.h" 3
# 1 "/usr/xenomai/include/boilerplate/compiler.h" 1 3
# 21 "/usr/xenomai/include/boilerplate/compiler.h" 3
# 1 "/usr/lib/gcc/arm-linux-gnueabihf/6/include/stddef.h" 1 3 4
# 22 "/usr/xenomai/include/boilerplate/compiler.h" 2 3
# 65 "/usr/xenomai/include/boilerplate/compiler.h" 3
void __invalid_operand_size(void);
# 22 "/usr/xenomai/include/cobalt/wrappers.h" 2 3
# 29 "/usr/xenomai/include/cobalt/stdio.h" 2 3





__typeof__(int) __cobalt_vfprintf(FILE *stream, const char *fmt, va_list args); __typeof__(int) __real_vfprintf(FILE *stream, const char *fmt, va_list args); __typeof__(int) __wrap_vfprintf(FILE *stream, const char *fmt, va_list args);



__typeof__(int) __cobalt___vfprintf_chk(FILE *stream, int level, const char *fmt, va_list ap); __typeof__(int) __real___vfprintf_chk(FILE *stream, int level, const char *fmt, va_list ap); __typeof__(int) __wrap___vfprintf_chk(FILE *stream, int level, const char *fmt, va_list ap)
                                 ;

__typeof__(int) __cobalt___vprintf_chk(int flag, const char *fmt, va_list ap); __typeof__(int) __real___vprintf_chk(int flag, const char *fmt, va_list ap); __typeof__(int) __wrap___vprintf_chk(int flag, const char *fmt, va_list ap)
                                       ;

__typeof__(int) __cobalt___printf_chk(int flag, const char *fmt, ...); __typeof__(int) __real___printf_chk(int flag, const char *fmt, ...); __typeof__(int) __wrap___printf_chk(int flag, const char *fmt, ...);

__typeof__(int) __cobalt___fprintf_chk(FILE *fp, int flag, const char *fmt, ...); __typeof__(int) __real___fprintf_chk(FILE *fp, int flag, const char *fmt, ...); __typeof__(int) __wrap___fprintf_chk(FILE *fp, int flag, const char *fmt, ...);

int __rt_vfprintf_chk(FILE *stream, int level,
        const char *fmt, va_list args);

void __rt_vsyslog_chk(int priority, int level,
        const char *fmt, va_list args);



__typeof__(int) __cobalt_vprintf(const char *fmt, va_list args); __typeof__(int) __real_vprintf(const char *fmt, va_list args); __typeof__(int) __wrap_vprintf(const char *fmt, va_list args);

__typeof__(int) __cobalt_fprintf(FILE *stream, const char *fmt, ...); __typeof__(int) __real_fprintf(FILE *stream, const char *fmt, ...); __typeof__(int) __wrap_fprintf(FILE *stream, const char *fmt, ...);

__typeof__(int) __cobalt_printf(const char *fmt, ...); __typeof__(int) __real_printf(const char *fmt, ...); __typeof__(int) __wrap_printf(const char *fmt, ...);

__typeof__(int) __cobalt_puts(const char *s); __typeof__(int) __real_puts(const char *s); __typeof__(int) __wrap_puts(const char *s);

__typeof__(int) __cobalt_fputs(const char *s, FILE *stream); __typeof__(int) __real_fputs(const char *s, FILE *stream); __typeof__(int) __wrap_fputs(const char *s, FILE *stream);


__typeof__(int) __cobalt_putchar(int c); __typeof__(int) __real_putchar(int c); __typeof__(int) __wrap_putchar(int c);
# 80 "/usr/xenomai/include/cobalt/stdio.h" 3
__typeof__(int) __cobalt_fputc(int c, FILE *stream); __typeof__(int) __real_fputc(int c, FILE *stream); __typeof__(int) __wrap_fputc(int c, FILE *stream);
# 92 "/usr/xenomai/include/cobalt/stdio.h" 3
__typeof__(size_t) __cobalt_fwrite(const void *ptr, size_t sz, size_t nmemb, FILE *stream); __typeof__(size_t) __real_fwrite(const void *ptr, size_t sz, size_t nmemb, FILE *stream); __typeof__(size_t) __wrap_fwrite(const void *ptr, size_t sz, size_t nmemb, FILE *stream)
                                                                    ;

__typeof__(int) __cobalt_fclose(FILE *stream); __typeof__(int) __real_fclose(FILE *stream); __typeof__(int) __wrap_fclose(FILE *stream);

int rt_vfprintf(FILE *stream, const char *format, va_list args);

int rt_vprintf(const char *format, va_list args);

int rt_fprintf(FILE *stream, const char *format, ...);

int rt_printf(const char *format, ...);

int rt_puts(const char *s);

int rt_fputs(const char *s, FILE *stream);

int rt_fputc(int c, FILE *stream);

int rt_putchar(int c);

size_t rt_fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);

void rt_syslog(int priority, const char *format, ...);

void rt_vsyslog(int priority, const char *format, va_list args);

int rt_print_init(size_t buffer_size, const char *name);

const char *rt_print_buffer_name(void);

void rt_print_flush_buffers(void);
# 23 "/root/Bela/projects/bela-game/aubiopitch.c" 2


# 24 "/root/Bela/projects/bela-game/aubiopitch.c"
aubio_pitch_t *o;
aubio_wavetable_t *wavetable;
fvec_t *pitch;
smpl_t amp;

int mix_input = 0;
int buffer_size = 1024;
char_t * pitch_unit = "default";
char_t * pitch_method = "default";
uint_t hop_size = 128;
smpl_t pitch_tolerance = 0.0;
float samplerate;
smpl_t silence_threshold = -90.;
unsigned int directChannel = 0;
unsigned int otherChannel = 1;
float cancellationGain = 1;


void process_block(fvec_t * ibuf, fvec_t * obuf)
{
  smpl_t freq;

  aubio_pitch_do (o, ibuf, pitch);

  fvec_zeros(obuf);
  freq = fvec_get_sample(pitch, 0);

  amp = aubio_level_lin (ibuf);
  aubio_wavetable_set_amp ( wavetable, 100*amp);
  aubio_wavetable_set_freq ( wavetable, freq );
  if (mix_input)
    aubio_wavetable_do (wavetable, ibuf, obuf);
  else
    aubio_wavetable_do (wavetable, obuf, obuf);
}

void aubio_pitch_render(BelaContext *context, void *userData)
{
 smpl_t audioIn[context->audioFrames];
 for(unsigned int n = 0; n < context->audioFrames; ++n)
 {
  audioIn[n] = audioRead(context, n, directChannel) - cancellationGain * audioRead(context, n, otherChannel);
 }
 fvec_t ibuf = {
  .length = context->audioFrames,
  .data = audioIn
 };
 fvec_t obuf = {
  .length = context->audioFrames,
  .data = context->audioOut
 };
 process_block(&ibuf, &obuf);
}

int aubio_pitch_setup(float sampleRate) {
  samplerate = sampleRate;
  int ret = 0;
  printf ("pitch method: %s, ", pitch_method);
  printf ("pitch unit: %s, ", pitch_unit);
  printf ("buffer_size: %d, ", buffer_size);
  printf ("hop_size: %d, ", hop_size);
  printf ("tolerance: %f\n", pitch_tolerance);

  o = new_aubio_pitch (pitch_method, buffer_size, hop_size, samplerate);
  if (o == 
# 88 "/root/Bela/projects/bela-game/aubiopitch.c" 3 4
          ((void *)0)
# 88 "/root/Bela/projects/bela-game/aubiopitch.c"
              ) { ret = 1; goto beach; }
  if (pitch_tolerance != 0.)
    aubio_pitch_set_tolerance (o, pitch_tolerance);
  if (silence_threshold != -90.)
    aubio_pitch_set_silence (o, silence_threshold);
  if (pitch_unit != 
# 93 "/root/Bela/projects/bela-game/aubiopitch.c" 3 4
                   ((void *)0)
# 93 "/root/Bela/projects/bela-game/aubiopitch.c"
                       )
    aubio_pitch_set_unit (o, pitch_unit);

  pitch = new_fvec (1);

  wavetable = new_aubio_wavetable (samplerate, hop_size);
  aubio_wavetable_play ( wavetable );



  return ret;
beach:
  return ret;
}


void aubio_pitch_cleanup()
{
  del_aubio_pitch (o);
  del_aubio_wavetable (wavetable);
  del_fvec (pitch);
}
