# Pair Programming Context & Collaboration Framework

**Last Updated:** March 6, 2026  
**Developer:** [Your Name]  
**Project:** Multi-tenant Blazor WASM + Event-Driven Microservices Architecture

---

## 🏗️ Project Architecture

### Tech Stack
- **Frontend:** Blazor WebAssembly (multiple apps for different contexts)
- **.NET Version:** 9 (upgrading to 10/11 planned)
- **Architecture Pattern:** Microservices with Vertical Slice Architecture
- **Communication:** Event-driven architecture
- **Instrumentation:** Custom API services for system monitoring, reporting, and CI/CD feedback

### Key Components
1. **Multiple Blazor WASM Applications** - Context-specific frontends
2. **Microservices Infrastructure** - Vertical slices, event-driven
3. **Custom Monitoring APIs** - System monitoring and reporting
4. **CI/CD Integration** - Event/data feed for development metrics and highlights

### Instrumentation Approach
- Discrete processes and workflows instrumented for metrics
- Events and data feed into custom CI/CD API
- Highlights specific areas for development needs
- Enhanced error reporting and tracking

---

## 🤝 Collaboration Framework

### When Sharing an Idea

Provide these key elements:

```
[ FEATURE IDEA ]
- What's the user flow / event flow?
- Which service(s) does this touch?
- What metrics/events should it emit?
- Any cross-cutting concerns? (auth, caching, validation)
- Known constraints?

[ SAMPLE CODE / REFERENCES ]
- Show 1-2 existing similar patterns from your codebase
- Or describe the pattern you're thinking

[ SPECIFIC QUESTIONS ]
- Architectural concerns?
- Security considerations?
- Performance requirements?
```

### What I'll Contribute Per Feature

1. **Key Considerations** - Decision points specific to your vertical slice patterns
2. **Reusable Patterns** - Base classes, interfaces, abstractions
3. **Sample Implementations** - Concrete code demonstrating best practices for your stack
4. **Security Checklist** - Risk analysis and mitigation strategies specific to that feature

### Collaboration Phases

**Phase 1: Idea → Exploration**
- Share your general concept, workflows, and constraints
- I identify key decision points and architectural concerns

**Phase 2: Pattern Development**
- I provide reusable patterns and sample code
- Demonstrate efficient/maintainable approaches
- Include security considerations and instrumentation points

**Phase 3: Code Review & Refinement**
- You implement based on samples
- Iterate on edge cases, testing, instrumentation
- Feedback loops back to your metrics system

---

## 📋 Tips for Better Contexts

### Before Starting a Session
1. **Be Specific About Scope** - "Add user profile caching" vs "improve performance"
2. **Include Existing Patterns** - Show similar code you've written; I can adapt it
3. **Mention Constraints** - Performance targets, security requirements, tenant isolation needs
4. **Define Measurement** - How should this feature be instrumented? What metrics matter?
5. **Name the Service** - Which microservice/app? Is this cross-cutting?

### Context Quality Checklist
- [ ] Architecture layer clearly identified (frontend, service, cross-cutting)
- [ ] Related existing code/patterns included
- [ ] Specific constraints mentioned (performance, security, compat)
- [ ] Event flow or user flow described
- [ ] Instrumentation/metrics requirements stated
- [ ] Any known risks or edge cases noted

### Examples of Good Context vs. Poor Context

**Poor:** "How do I handle authentication?"  
**Better:** "I need to add claim-based role authorization to my Blazor WASM app. Currently using Azure AD. Need to check roles before exposing certain UI elements AND validate on the API side. Should also log authorization failures to the metrics API."

**Poor:** "Write a caching service"  
**Better:** "I'm seeing high latency on customer lookups (foreign key joins). Data changes rarely. I have a vertical slice for Customer Service. Need to cache at the service level. Should invalidate on Customer.Updated events. Need to track cache hits/misses for metrics."

---

## 🔐 Security & Performance Framework

### Always Include in Discussions
1. **Data Boundaries** - What data crosses microservice boundaries? Validate/sanitize?
2. **WASM Exposure** - What logic is client-side? (All credentials server-side? Sensitive ops protected?)
3. **Event Validation** - Who can publish events? Are payloads validated?
4. **Cross-Tenant** - Any multi-tenancy concerns? Isolation enforced?
5. **External Exposure** - APIs public? Throttling/rate-limiting needed?

---

## 📝 Service Communication Patterns

### What I Need to Know
- What messaging/event bus are you using? (MassTransit, NServiceBus, custom, etc.)
- How are synchronous calls handled? (Direct HTTP, gRPC, etc.)
- Dead-letter/error handling strategy?
- Retry policies?
- Saga/choreography patterns used?

*[Update with your actual patterns]*

---

## 🎯 Next Steps for Future Sessions

1. **Create a codebase reference file** - Include key file paths and example patterns from 1-2 representative services
2. **Instrumentation guide** - Show how you're currently capturing metrics (classes, logging approach, event structure)
3. **Common concerns checklist** - Any known areas that slow down development? (testing, deployment, etc.)
4. **Vertical slice template** - Share your standard structure for a new microservice or Blazor feature

---

## 💡 Template for Feature Requests

Use this template when bringing ideas:

```markdown
## Feature: [Clear Name]

### Context
- **Service(s):** [Which microservice/app]
- **User/Event Flow:** [Describe the flow]
- **Motivation:** [Why this matters]

### Requirements
- [ ] Primary requirement
- [ ] Secondary requirement
- [ ] Constraint/consideration

### Current State
[Show 1-2 existing patterns or sample code]

### Instrumentation
- Metrics to capture: [List]
- Events to emit: [List]
- Error scenarios: [List]

### Questions for Review
1. [Your specific question]
2. [Your specific question]

### Known Risks
- [Any identified concerns]
```

---

## 📞 Quick Reference

**Architecture Type:** Event-driven microservices + Blazor WASM frontends  
**Pattern:** Vertical Slices  
**.NET Target:** 9 (→ 10/11)  
**Primary Goal:** Reusable, efficient, well-instrumented code with strong security posture

**Most Helpful From Me:** Sample patterns, security review, instrumentation guidance, architectural trade-off analysis

---

*This file should be updated as your architecture evolves or new patterns emerge.*
