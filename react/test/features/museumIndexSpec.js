import MuseumsContainer from './../../src/components/MuseumsContainer';

describe('Museum Index', () => {
  let wrapper;

  beforeEach(() => {
    spyOn(global, 'fetch').and.returnValue(
      createResponseFromFixture('museum/museumsIndex')
    );
  });

  afterEach(() => {
    wrapper.unmount();
  });

  describe('visiting the museum homepage', () => {
    beforeEach(() => {
      wrapper = mount(
        <MuseumsContainer />
      );
    });

    it('has museum and their information', done => {
      setTimeout(() => {
        let pageText = wrapper.text();
        expect(pageText).toMatch('Barnes Foundation');
        expect(pageText).toMatch('Eastern State Penitentiary');
        expect(pageText).toMatch('Philadelphia Museum of Art');
        done();
      }, 1000)
    });
  });
});
