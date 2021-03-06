require 'spec_helper'

describe Session::Session, '#include?(object)' do
  let(:mapper)        { registry.resolve_model(DomainObject) }
  let(:registry)      { DummyRegistry.new                    }
  let(:domain_object) { DomainObject.new                     }
  let(:object)        { described_class.new(registry)        }

  subject { object.include?(domain_object) }


  context 'when domain object is tracked' do
    before do
      object.persist(domain_object)
    end

    it { should be(true) }

    it_should_behave_like 'an idempotent method'
  end

  context 'when domain object is NOT tracked' do
    it { should be(false) }

    it_should_behave_like 'an idempotent method'
  end
end
